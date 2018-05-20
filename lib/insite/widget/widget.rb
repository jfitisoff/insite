require_relative 'widget_methods'
require_relative '../methods/common_methods'

# Allows the page object developer to encapsulate common web application features
# into a "widget" that can be reused across multiple pages. Let's say that a
# web application has a search widget that is used in 11 of the application's pages.
# With a modern web app all of those search widgets will likely be implemented
# in a common way, with a similar or identical structure in the HTML. The widget
# would look something like this:
#
#  class SearchWidget < Widget
#    text_field :query, id: 'q'
#    button :search_button, name: 'Search'
#
#    def search(search_query)
#      query.set search_query
#      search_button.click
#    end
#
#    def clear
#      query.set ''
#      search_button.click
#    end
#  end
#
# Once the widget has been defined, it can be included in a page object definition
# like this:
#
#  class SomePage < SomeSite::Page
#    set_url 'some_page'
#    search_widget :search_for_foo, :div, class: 'search-div'
#  end
#
# The search widget can then be accessed like this when working with the site:
#  site.some_page.search_for_foo 'some search term'
#  site.search_for_foo.clear
#
# Widgets can be embedded in other widgets, but in that case, the arguments for
# accessing the child widget need to be RELATIVE to the parent widget. For example:
#
#  # Generic link menu, you hover over it and one or more links are displayed.
#  class LinkMenu < Widget
#  end
#
#  # Card widget that uses the link_menu widget. In this case, link_menu widget
#  # arguments will be used to find a div a div with class == 'card-action-links'
#  # WITHIN the card itself. This ensures that, if there are multiple cards
#  # on the page that have link_menus, the CORRECT link_menu will be accessed
#  # rather than one for some other card widget.
#  class Card < Widget
#    link_menu :card_menu, :div, class: 'card-action-links'
#  end
module Insite
  class Widget
    attr_reader :site, :browser, :type, :args, :target

    include CommonMethods
    alias_method :update_widget, :update_object

    class << self
      attr_reader :widget_elements

      include Insite::DOMMethods
      include Insite::WidgetMethods

      # - Don't allow the user to create a widget with a name that matches a DOM
      #   element.
      #
      # - Don't allow the user to create a widget method that references a
      #   collection (because this will be done automatically.)
      tmp = name.to_s.underscore.to_sym
      if DOM_METHODS.include?(name.to_s.underscore.to_sym)
        raise "#{name} cannot be used as a widget name, as the methodized version of the class name (#{name.to_s.underscore} conflicts with a Watir DOM method.)"
      elsif Watir::Browser.methods.include?(name.to_s.underscore.to_sym)
        raise "#{name} cannot be used as a widget name, as the methodized version of the class name (#{name.to_s.underscore} conflicts with a Watir::Browser method.)"
      end

      if tmp =~ /.*s+/
        raise "Invalid widget type :#{tmp}. You can create a widget for the DOM object but it must be for :#{tmp.singularize} (:#{tmp} will be created automatically.)"
      end
    end # Self.

    extend Forwardable

    def self.inherited(subclass)
      name_string            = subclass.name.demodulize.underscore
      pluralized_name_string = name_string.pluralize

      if name_string == pluralized_name_string
        raise ArgumentError, "When defining a new widget, define the singular version only (Plural case will be handled automatically.)"
      end

      # Creates an accessor method for a new widget when one gets defined via inheritance.
      # In this case the method is for a single instance of the widget. The top-level block
      # defines the widget accessor in the Insite::Widget module. The methods in that module
      # automatically get included in page classes and are used to define widget accessors.
      #
      # In this case an accessor for an individual widget is being defined.
      WidgetMethods.send(:define_method, name_string) do |method_name, dom_type, *args, &block|
        unless name_string == 'Widget'
          @widget_elements ||= []
          @widget_elements << method_name.to_sym unless @widget_elements.include?(method_name.to_sym)

          define_method(method_name) do
            if is_a? Widget
              elem = send(dom_type, *args, &block)
            else
              elem = @browser.send(dom_type, *args, &block)
            end

            # TODO: Bandaid.
            if dom_type.to_s == dom_type.to_s.pluralize
              raise ArgumentError, "Individual widget method :#{method_name} cannot initialize a widget using an element collection (#{elem.class}.) Use :#{method_name.pluralize} rather than :#{method_name} if you want to define a widget collection."
            else
              subclass.new(self, dom_type, *args, &block)
            end
          end
        end
      end

      # Creates an accessor method for a new widget when one gets defined via inheritance.
      # In this case the method is for a single instance of the widget. The top-level block
      # defines the widget accessor in the Insite::Widget module. The methods in that module
      # automatically get included in page classes and are used to define widget accessors.
      #
      # In this case an accessor is being defined for a widget collection.
      #
      # TODO: The current implementation for widget collections isn't ideal and should be
      # replaced at some point. It'd be much better to use a (lazy) custom collection for this.
      WidgetMethods.send(:define_method, pluralized_name_string) do |method_name, dom_type, *args, &block|
        unless name_string == 'Widget'
          @widget_elements ||= []
          @widget_elements << method_name.to_sym unless @widget_elements.include?(method_name.to_sym)

          define_method(method_name) do
            if is_a?(Widget) && present?
              elem = send(dom_type, *args, &block)
            elsif is_a?(Widget) && !present?
              return []
            else
              elem = @browser.send(dom_type, *args, &block)
            end

            # TODO: Bandaid.
            if dom_type.to_s == dom_type.to_s.singularize
              raise ArgumentError, "Widget collection method :#{method_name} cannot initialize a widget collection using an individual element (#{elem.class}.) Use :#{method_name.to_s.singularize} rather than :#{method_name} if you want to define a widget for an individual element."
            else
              # TODO: Revisit the whole .to_a thing, need a custom collection or
              # somesuch (don't bypass watir wait logic.)
              t = Time.now
              loop do
                elem = @browser.send(dom_type, *args, &block)
                break if elem.present? && elem.length > 0
                break if Time.now > t + 4
              end

              if elem.present?
                elem.to_a.map! { |x| subclass.new(self, x, [], &block) }
              else
                []
              end
            end
          end
        end
      end
    end # self.

    # This method gets used 2 different ways. Most of the time, dom_type and args
    # will be a symbol and a set of hash arguments that will be used to select an
    # element.
    #
    # In some cases, dom_type can be a Watir DOM object, and in this case, the
    # args are ignored and the widget is initialized using the Watir object.
    #
    # TODO: Needs a rewrite, lines between individual and collection are blurred
    # here and that makes the code more confusing. And there should be a proper
    # collection class for element collections, with possibly some AR-like accessors.
    def initialize(parent, dom_type, *args)
      @parent   = parent
      @site     = parent.class.ancestors.include?(Insite) ? parent : parent.site
      @browser  = @site.browser
      @widget_elements = self.class.widget_elements

      if dom_type.is_a?(Watir::HTMLElement) || dom_type.is_a?(Watir::Element)
        @dom_type = nil
        @args     = nil
        @target   = dom_type
      elsif [String, Symbol].include? dom_type.class
        @dom_type = dom_type
        @args     = args

        if @parent.is_a? Widget
          @target = @parent.send(dom_type, *args)
        else
          @target = @browser.send(dom_type, *args)
        end

        # New webdriver approach.
        begin
          @target.scroll.to
          sleep 0.1
        rescue => e
          t = Time.now + 2
          while Time.now <= t do
            break if @target.present?
            sleep 0.1
          end
        end
      elsif dom_type.is_a? Watir::ElementCollection
        @dom_type = nil
        @args     = nil
        if @parent.is_a? Widget
          @target = dom_type.map { |x| self.class.new(@parent, x.to_subtype) }
        else
          @target = dom_type.map { |x| self.class.new(@site, x.to_subtype) }
        end
      else
        raise "Unhandled exception."
      end
    end

    # Delegates method calls down to the widget's wrapped element if the element supports the method.
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
          page_arguments = args[0]#.with_indifferent_access
        elsif args.empty?
          # Do nothing.
        elsif args[0].nil?
          raise ArgumentError, "Optional argument for :#{mth} must be a hash. Got NilClass."
        else
          raise ArgumentError, "Optional argument must be a hash (got #{args[0].class}.)"
        end

        if present?
          # If it's a widget we want to hover over it to ensure links are visible
          # before trying to find them.
          if self.is_a?(Widget)
            t = Time.now
            loop do
              begin
                scroll.to
                hover
                sleep 0.2
                break
              rescue => e
                break if Time.now > t + 10
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
          # Dynamic helper method for links. If a match is found, clicks on the link and performs follow up actions.
          elsif elem = as.find { |x| x.text =~ /^#{mth.to_s.gsub('_', '.*')}/i } # See if there's a matching button and treat it as a method call if so.
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

            if @site.modal.present?
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
          raise NoMethodError, "Unhandled method call `#{mth}' for #{self.class} (The widget was not present in the DOM at the point that the method was called.)"
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
  end
end

# TODO: For legacy code, should be removed.
class Widget < Insite::Widget
end
