require_relative 'component_methods'
require_relative 'component_collection'
require_relative 'component_instance_methods'
require_relative '../methods/common_methods'

# Allows the page object developer to encapsulate common web application features
# into components that can be reused across multiple pages.
module Insite
  class Component
    attr_reader :args, :browser, :non_relative, :selector, :site, :type, :target
    class_attribute :selector, default: {}
    self.selector = self.selector.clone

    include Insite::CommonMethods
    extend  Insite::DOMMethods
    include Insite::ElementInstanceMethods
    extend  Insite::ComponentMethods
    include Insite::ComponentInstanceMethods
    alias_method :update_component, :update_object

    class << self
      attr_reader :component_elements


      # - Don't allow the user to create a component with a name that matches a DOM
      #   element.
      #
      # - Don't allow the user to create a component method that references a
      #   collection (because this will be done automatically.)
      tmp = name.to_s.underscore.to_sym
      if DOM_METHODS.include?(name.to_s.underscore.to_sym)
        raise "#{name} cannot be used as a component name, as the methodized version of the class name (#{name.to_s.underscore} conflicts with an Insite DOM method.)"
      elsif Watir::Browser.methods.include?(name.to_s.underscore.to_sym)
        raise "#{name} cannot be used as a component name, as the methodized version of the class name (#{name.to_s.underscore} conflicts with a Insite::Browser method.)"
      end

      if tmp =~ /.*s+/
        raise "Invalid component type :#{tmp}. You can create a component for the DOM object but it must be for :#{tmp.singularize} (:#{tmp} will be created automatically.)"
      end

    end # Self.

    extend Forwardable

    def self.select_by(hsh = {})
      tmp = selector.clone
      hsh.each do |k, v|
        if %i(css, xpath).include? k
          raise ArgumentError, "The :#{k} selector argument is not currently allowed for component definitions."
        elsif k == :tag_name && tmp[k] && v && tmp[k] != v
          raise(
            ArgumentError,
            "\n\nInvalid use of the :tag_name selector in the #{self} component class. This component inherits " \
            "from the #{superclass} component, which already defines #{superclass.selector[:tag_name]} as " \
            "the tag name. If you are intentionally trying to overwrite the tag name in the inherited class, " \
            "use #{self}.select_by! in the page definition in place of #{self}.select_by. Warning: The " \
            "select_by! method arguments overwrite the selector that were inherited from #{superclass}. " \
            "So if you DO use it you'll need to specify ALL of the selector needed to properly identify the " \
            "#{self} component.\n\n",
            caller
          )
        elsif tmp[k].is_a?(Array)
            tmp[k] = ([tmp[k]].flatten + [v].flatten).uniq
        else
          tmp[k] = v
        end
      end
      self.selector = tmp
    end

    def self.select_by!(hsh = {})
      self.selector = hsh
    end

    def self.inherited(subclass)
      name_string = subclass.name.demodulize.underscore
      pluralized_name_string = name_string.pluralize

      if name_string == pluralized_name_string
        pluralized_name_string = name_string + 'es'
      end

      collection_class = Class.new(Insite::ComponentCollection) do
        @collection_member_type = subclass
      end
      Insite.const_set(pluralized_name_string.camelize, collection_class)

      {
        name_string => subclass,
        pluralized_name_string => collection_class
      }.each do |nstring, klass|
        ComponentMethods.send(:define_method, nstring) do |mname, *a, &block|
          nstring == name_string ? default_dom_type = :element : default_dom_type = :elements
          unless nstring == 'Component'
            @component_elements ||= []
            unless @component_elements.include?(mname.to_sym)
              @component_elements << mname.to_sym
            end

            hsh = parse_args(a).merge(klass.selector)
            dom_type = hsh.delete(:dom_type)

            define_method(mname) do
              klass.new(self, dom_type || default_dom_type, **hsh, &block)
            end
          end
        end

        ComponentInstanceMethods.send(:define_method, nstring) do |*a|
          nstring == name_string ? default_dom_type = :element : default_dom_type = :elements

          hsh = parse_args(a).merge(subclass.selector)
          dom_type = hsh.delete(:dom_type)

          klass.new(self, dom_type || default_dom_type, **hsh)
        end
      end
    end # self.inherited

    def attributes
      nokogiri.xpath("//#{@selector[:tag_name]}")[0].attributes.values.map do |x|
        x.name == 'class' ? [x.name, x.value.split] : [x.name, x.value]
      end.to_h
    end

    def classes
      attribute('class').split
    end

    # This method gets used 2 different ways. Most of the time, dom_type and args
    # will be a symbol and a set of hash arguments that will be used to select an
    # element.
    #
    # In some cases, dom_type can also be a Watir DOM object, and in this case, the
    # args are ignored and the component is initialized using the DOM object.
    #
    # TODO: Needs a rewrite, lines between individual and collection are blurred
    # here and that makes the code more confusing. And there should be a proper
    # collection class for element collections, with possibly some AR-like accessors.
    def initialize(parent, dom_type, *args)
      @parent   = parent
      @site     = parent.class.ancestors.include?(Insite) ? parent : parent.site
      @browser  = @site.browser
      @component_elements = self.class.component_elements
      @selector = self.class.selector

      if dom_type.is_a?(Insite::Element) || dom_type.is_a?(Insite::ElementCollection)
        @dom_type = nil
        @args     = nil
        @target   = dom_type
      elsif dom_type.is_a?(Watir::Element) || dom_type.is_a?(Watir::ElementCollection)
        @dom_type = nil
        @args     = nil
        @target   = dom_type
      elsif [::String, ::Symbol].include? dom_type.class
        @dom_type     = dom_type
        @args         = merge_selector_args(parse_args(args))
        @non_relative = @args.delete(:non_relative) || false

        if @non_relative
          @target = @browser.send(dom_type, **@args)
        else
          if @parent.is_a?(Component) || @parent.is_a?(Element)
            @target = @parent.send(dom_type, **@args)
          else
            @target = @browser.send(dom_type, **@args)
          end
        end

        # if !@non_relative
        # #   @target = @browser.send(dom_type, *args)
        # # elsif @parent.is_a? Component
        #   @target = @parent.send(dom_type, *args)
        # else
        #   @target = @browser.send(dom_type, *args)
        # end

        # New webdriver approach.
        begin
          @target.scroll.to
          sleep 0.1
        rescue => e
          t = ::Time.now + 2
          while ::Time.now <= t do
            break if @target.present?
            sleep 0.1
          end
        end
      else
        raise "Unhandled exception."
      end
    end

    # Delegates method calls down to the component's wrapped element if the
    # element supports the method being called.
    #
    # Supports dynamic link methods. Examples:
    #  s.accounts_page account
    #
    #  # Nav to linked page only.
    #  s.account_actions.edit_account_info
    #
    #  # Update linked page after nav:
    #  s.account_actions.edit_account_info username: 'foo'
    #
    #  # Link with modal (if the modal requires args they should be passed as hash keys):
    #  # s.hosted_pages.refresh_urls
    def method_missing(mth, *args, &block)
      if @target.respond_to? mth
        @target.send(mth, *args, &block)
      else
        if args[0].is_a? Hash
          page_arguments = args[0]
        elsif args.empty?
          # Do nothing.
        elsif args[0].nil?
          raise ArgumentError, "Optional argument for :#{mth} must be a hash. Got NilClass."
        else
          raise ArgumentError, "Optional argument must be a hash (got #{args[0].class}.)"
        end

        if present?
          # If it's a component we want to hover over it to ensure links are visible
          # before trying to find them.
          if self.is_a?(Component)
            t = ::Time.now
            loop do
              begin
                scroll.to
                hover
                sleep 0.2
                break
              rescue => e
                break if ::Time.now > t + 10
                sleep 0.2
              end
            end
          end

          # Dynamic helper method, returns DOM object for link (no validation).
          if mth.to_s =~ /_link$/
            return a(text: /^#{mth.to_s.sub(/_link$/, '').gsub('_', '.*')}/i)
          # Dynamic helper method, returns DOM object for button (no validation).
          elsif mth.to_s =~ /_button$/
            return button(value: /^#{mth.to_s.sub(/_button$/, '').gsub('_', '.*')}/i)
          # Dynamic helper method for links. If a match is found, clicks on the
          # link and performs follow up actions. Start by seeing if there's a
          # matching button and treat it as a method call if so.
          elsif elem = as.find { |x| x.text =~ /^#{mth.to_s.gsub('_', '.*')}/i }
            elem.click
            sleep 1

            current_page = @site.page

            if page_arguments.present?

              if current_page.respond_to?(:submit)
                current_page.submit page_arguments
              elsif @browser.input(xpath: "//div[starts-with(@class,'Row') and last()]//input[@type='submit' and last()]").present?
                current_page.update_page page_arguments
                @browser.input(xpath: "//div[starts-with(@class,'Row') and last()]//input[@type='submit' and last()]").click
              end
              current_page = @site.page
            end
          # Dynamic helper method for buttons. If a match is found, clicks on the link and performs follow up actions.
          elsif elem = buttons.find { |x| x.text =~ /^#{mth.to_s.gsub('_', '.*')}/i } # See if there's a matching button and treat it as a method call if so.
            elem.click
            sleep 1

            # TODO: Legacy support. Revisit.
            if @site.respond_to?(:modal) && @site.modal.present?
              @site.modal.continue(page_arguments)
            else
              current_page = @site.page

              if page_arguments.present?
                if current_page.respond_to?(:submit)
                  current_page.submit page_arguments
                elsif @browser.input(xpath: "//div[starts-with(@class,'Row') and last()]//input[@type='submit' and last()]").present?
                  current_page.update_page page_arguments
                  @browser.input(xpath: "//div[starts-with(@class,'Row') and last()]//input[@type='submit' and last()]").click
                end
                current_page = @site.page
              end
            end
          else
            raise NoMethodError, "undefined method `#{mth}' for #{self.class}."
          end
        else
          raise NoMethodError, "Unhandled method call `#{mth}' for #{self.class} (The component was not present in the DOM at the point that the method was called.)"
        end

        page_arguments.present? ? page_arguments : current_page
      end
    end

    def present?
      sleep 0.1
      begin
        if @parent
          if @parent.present? && @target.present?
            true
          else
            false
          end
        else
          if @target.present?
            true
          else
            false
          end
        end
      rescue => e
        false
      end
    end

    private
    def merge_selector_args(other = {})
      tmp = self.class.selector.clone

      if tmp.empty? && other.empty?
        raise ArgumentError, "No selector values have been specified for the " \
        "#{self.class} component. And no selector arguments were specified " \
        "when calling the instance component's accessor method. "
      end

      other.each do |k, v|
        if k == :tag_name && tmp[k] != v
          raise(
            ArgumentError,
            "\n\nInvalid use of the :tag_name selector in the #{self} component class. This component inherits " \
            "from the #{superclass} component, which already defines #{superclass.selector[:tag_name]} as " \
            "the tag name. If you are intentionally trying to overwrite the tag name in the inherited class, " \
            "use #{self}.select_by! in the page definition in place of #{self}.select_by. Warning: The " \
            "select_by! method arguments overwrite the selector arguments that were inherited from #{superclass}. " \
            "So if you DO use it you'll need to specify ALL of the selector needed to properly identify the " \
            "#{self} component (because nothing will be inherited.)\n\n",
            caller
          )
        elsif tmp[k].is_a?(Array) && v.is_a?(Array) # TODO: class check here?
          tmp[k] = (tmp[k].flatten + [v].flatten).uniq
        else
          tmp[k] = v
        end
      end

      tmp
    end
  end
end

# # TODO: For legacy code, should be removed eventually.
# class Component < Insite::Component
# end
