# TODO: Title matcher?
# TODO: Add page query methods.
module Insite
  class DefinedPage
    attr_reader :arguments, :browser, :has_fragment, :page_attributes, :page_elements, :page_features, :page_url, :query_arguments, :required_arguments, :site, :url_template, :url_matcher, :component_elements

    include Insite::CommonMethods
    extend  Insite::ComponentMethods
    include Insite::ComponentInstanceMethods
    extend  Insite::DOMMethods

    alias_method :update_page, :update_object

    class << self
      attr_reader :has_fragment, :page_attributes, :page_elements, :page_features, :page_url, :url_matcher, :url_template
      attr_accessor :component_elements

      def describe
    puts <<-EOF
    Page Class:\t#{name} (#{__FILE__})
    URL Template:\t#{@url_template.pattern}"
    URL Matcher:\t#{@url_matcher || 'Not specified.'}

    Contains user-defined logic for a single page.

    Page Elements:\n#{@page_elements.sort.map { |x| "  #{x} #{x.class.to_s.methodize}\n" }.join }

    Components:\n#{@component_elements.sort.map { |x| "  #{x} #{x.class.to_s.methodize}\n" }.join }

    Features:\n#{@component_elements.sort.map { |x| "  #{x} #{x.class.to_s.methodize}\n" }.join }

    EOF

      end

      # private
      # def element_container(name, type, *args, &block)
      #   tmpklass = Class.new(ElementContainer) do
      #     self.class_eval(&block) if block_given?
      #   end
      #   cname = name.to_s.camelcase + 'Container'
      #   const_set(cname, tmpklass) unless const_defined? cname
      #
      #   @page_elements ||= [name.to_sym]
      #   # @page_elements << name.to_sym
      #
      #   define_method(name) do
      #     self.class.const_get(cname).send(:new, @site, @browser.send(type, *args))
      #   end
      # end
      # public

      # Creates a section within the page. TODO: section is a DOM element, rename this.
      def feature(fname, klass = Insite::Feature, &block)
        tmpklass = Class.new(klass) do
          self.class_eval(&block) if block_given?
        end

        const_set(fname.to_s.camelcase, tmpklass) unless const_defined? fname.to_s.camelcase
        @page_features ||= []
        @page_features << fname.to_s.underscore.to_sym
        define_method(fname.to_s.underscore) do
          tmpklass.new(page = self)
        end
      end

      # Allows you to set special page attributes that affect page behavior. The two page
      # attributes currently supported are :navigation_disabled and :page_template:
      #
      # * When :navigation_disabled is specified as a page attribute, all automatic and
      #   manual browser navigation is disabled. If you call the page's page methods
      #   automatic navigation is turned off -- it won't automatically load the page for
      #   you. And it the method will raise a Insite::Errors::PageNavigationNotAllowedError if you call
      #   the page's accessor method while you aren't actually on the page. And finally,
      #   the page's visit method is disabled. This attribute is useful only when you
      #   have a page that can't be automatically navigated to, in which case all of
      #   the navigation features described above wouldn't work anyway.
      #
      # * When :page_template is specified as a page attribute, the site object won't
      #   create an accessor method for the page when initializing and also won't include
      #   the page when calling the site object's pages method. This allows you to define
      #   a page object for inheritance purposes only. The idea behind this is to put common
      #   features one or more of these templates, which won't get used directly. Then your
      #   other page objects that you actually do want to use can inherit from one of the
      #   templates, gaining all of its features. For example, you can put things like a
      #   logout link or common menus into a template and then have all of the page objects
      #   that need those features inherit from the template and get those features
      #   automatically.
      #
      # If an unsupported attribute is specified a Insite::Errors::PageConfigError will be raised.
      #
      # Usage:
      #  set_attributes :attr1, :attr2
      def set_attributes(*args)
        @page_attributes ||= []
        args.each do |arg|
          case arg
          when :navigation_disabled
            @navigation_disabled = true
          when :page_template
            @page_template = true
          else
            raise(
              Insite::Errors::PageConfigError,
              "Unsupported page attribute argument: #{arg} for #{self} page definition. " \
              "Argument class: #{arg.class}. Arguments must be one or more of the following " \
              "symbols: :navigation_disabled, :template."
            )
          end
        end

        @page_attributes = args
      end

      def page_template?
        @page_attributes ||= []
        @page_attributes.include? :page_template
      end

      # Returns an array of symbols representing the required arguments for the page's page URL.
      def required_arguments
        @arguments ||= @url_template.keys.map { |k| k.to_sym }
      end

      def query_arguments
        required_arguments.find { |x| @url_template.pattern =~ /\?.*#{x}=*/ }
      end

      # Used to define the full or relative URL to the page. Typically, you will *almost* *always* want to use
      # this method when defining a page object (but see notes below.) The URL can be defined in a number
      # of different ways. Here are some examples using Google News:
      #
      # *Relative* *URL*
      #
      #  set_url "/nwshp?hl=en"
      #
      # Relative URLs are most commonly used when defining page objects. The idea here is that you can
      # change the base_url when calling the site object, which allows you to use the same code across
      # multiple test environments by changing the base_url as you initialize a site object.
      #
      # *Relative* *URL* *with* *URL* *Templating*
      #  set_url "/nwshp?hl={language}"
      #
      # This takes the relative URL example one step further, allowing you to set the page's parameters.
      # Note that the the language specified in the first relative URL example ('en') was replaced by
      # '{language}' in this one. Insite uses the Addressable library, which supports this kind of
      # templating. When you template a value in the URL, the page object will allow you to specify the
      # templated value when it's being initialized. Here's an example of how this works using a news site.
      # Here's the base site class:
      #
      #  class NewsSite
      #    include Insite
      #  end
      #
      # Here's a page object for the news page, templating the language value in the URL:
      #
      #  class NewsPage < NewsSite::Page
      #    set_url "/news?l={language}"
      #  end
      #
      # After you've initialized the site object you can load the Spanish or French versions of the
      # page by changing the hash argument used to call the page from the site object:
      #
      #  site = NewsSite.new(base_url: "http://news.somesite.com")
      #  site.news_page(language: 'es')
      #  site.news_page(language: 'fr')
      #
      # In addition to providing a hash of templated values when initializing a page you can also use
      # an object, as long as that object responds to all of the templated arguments in the page's
      # URL definition. Here's a simple class that has a language method that we can use for the news
      # page described above:
      #
      #  class Country
      #    attr_reader :language
      #
      #    def initialize(lang)
      #      @language = lang
      #    end
      #  end
      #
      # In the example below, the Country class is used to create a new new country object called 'c'.
      # This object has been initialized with a Spanish language code and the news page
      # will load the spanish version of the page when it's called with the country object.
      #
      #  site = NewsSite.new(base_url: "http://news.somesite.com")
      #  c = Country.new('es')
      #  => <Country:0x007fcb0dc67f98 @language="es">
      #  c.language
      #  => 'es'
      #  site.news_page(c)
      #  => <NewsPage:0x003434546566>
      #
      # If one or more URL parameters are missing when the page is getting initialized then the page
      # will look at the hash arguments used to initialize the site. If the argument the page needs is
      # defined in the site's initialization arguments it will use that. For example, if the site
      # is initialized with a port, subdomain, or any other argument you can use those values
      # when defining a page URL. Example:
      #
      #  class ConfigPage < MySite::Page
      #    set_url "/foo/{subdomain}/config"
      #  end
      #
      #  site = MySite.new(subdomain: 'foo')
      #  => <MySite:0x005434546511>
      #  site.configuration_page # No need to provide a subdomain here as long as the site has it.
      #  => <ConfigPage:0x705434546541>
      #
      # *Full* *URL*
      #  set_url "http://news.google.com/nwshp?hl=en"
      #
      # Every once in a while you may not want to use a base URL that has been defined. This allows you
      # to do that. Just define a complete URL for that page object and that's what will get used; the
      # base_url will be ignored.
      #
      # *No* *URL*
      #
      # The set_url method is not mandatory. when defining a page. If you don't use set_url in the page
      # definition then the page will defined the base_url as the page's URL.
      def set_url(url)
        url ? @page_url = url : nil
      end

      def set_url_template(base_url)
        case @page_url
        when /(http:\/\/|https:\/\/)/i
          @url_template = Addressable::Template.new(@page_url)
        else
          @url_template = Addressable::Template.new(Addressable::URI.parse("#{base_url}#{@page_url}"))
        end
        @has_fragment = @url_template.pattern =~ /#/
      end

      # Optional. Allows you to specify a fallback mechanism for checking to see if the correct page is
      # being displayed. This only gets used in cases where the primary mechanism for checking a page
      # (the URL template defined by Page#set_url) fails to match the current browser URL. When that
      # happens the regular expression defined here will be applied and the navigation check will pass
      # if the regular expression matches the current browser URL.
      #
      # In most cases, you won't need to define a URL matcher and should just rely on the default page
      # matching that uses the page's URL template. The default matching should work fine for most cases.
      def set_url_matcher(regexp)
        regexp ? @url_matcher = regexp : nil
      end

      # Used to import page features for use within the page. Example:
      #
      #  class ConfigPage < MySite::Page
      #    use_features :footer, :sidebar
      #  end
      #
      # Then, once the page object has been initialized:
      #
      #  site.config_page.footer.about.click
      #
      # Use the PageFeature class to define page features.
      def use_features(*args)
        if @page_features
          @page_feature += args
        else
          @page_features = args
        end
      end

      def component_method(method_name, component_symbol, component_method, target_element)
        @component_methods ||= []
        @component_methods << method_name.to_sym unless @component_methods.include?(method_name.to_sym)

        define_method(method_name) do |*args, &block|
          self.class.const_get(component_symbol.to_s.camelize)
          .new(@site, @site.send(target_element))
          .send(component_method, *args, &block)
        end
      end
    end # Self.

    def describe
      self.class.describe
    end

    def defined?
      true
    end

    # Initializes a new page object. There's no need to ever call this method directly.
    # Your site class (the one that includes the Insite module) will handle this for
    # you
    def initialize(site, args = nil)
      @site               = site
      @browser            = process_browser

      @component_elements = self.class.component_elements ||= []
      @browser            = @site.browser
      @page_attributes    = self.class.page_attributes
      @page_url           = self.class.page_url
      @page_elements      = self.class.page_elements
      # TODO: Clean this up
      @page_features      = self.class.instance_variable_get(:@page_features)
      @required_arguments = self.class.required_arguments
      @url_matcher        = self.class.url_matcher
      @url_template       = self.class.url_template
      @query_arguments    = self.class.query_arguments
      @has_fragment       = self.class.has_fragment

      # Try to expand the URL template if the URL has parameters.
      @arguments = {}.with_indifferent_access # Stores the param list that will expand the url_template after examining the arguments used to initialize the page.
      match = @url_template.match(@browser.url)

      if @required_arguments.present? && !args
        @required_arguments.each do |arg|
          if match && match.keys.include?(arg.to_s)
            @arguments[arg] = match[arg.to_s]
          elsif @site.arguments[arg]
            @arguments[arg] = @site.arguments[arg]
          elsif @site.respond_to?(arg) && @site.public_send(arg)
            @arguments[arg] = @site.public_send(arg)
          else
            raise(
              Insite::Errors::PageInitError,
              "No arguments provided when attempting to initialize #{self.class.name}. " \
              "This page object requires the following arguments for initialization: "\
              ":#{@required_arguments.join(', :')}.\n\n#{caller.join("\n")}"
            )
          end
        end
      elsif @required_arguments.present?
        @required_arguments.each do |arg| # Try to extract each URL argument from the hash or object provided, OR from the site object.
          if args.is_a?(Hash) && args.present?
            args = args.with_indifferent_access

            if args[arg] #The hash has the required argument.
              @arguments[arg]= args[arg]
            elsif match.keys.include?(arg.to_s)
              @arguments[arg] = match[arg.to_s]
            elsif @site.respond_to?(arg)
              @arguments[arg] = site.public_send(arg)
            else
              raise(
                Insite::Errors::PageInitError,
                "A required page argument is missing. #{args.class} was provided, " \
                "but this object did not respond to :#{arg}, which is necessary to " \
                "build a URL for the #{self.class.name} page.\n\n#{caller.join("\n")}"
              )
            end
          elsif args # Some non-hash object was provided.
            if args.respond_to?(arg) #The hash has the required argument.
              @arguments[arg]= args.public_send(arg)
            elsif @site.respond_to?(arg)
              @arguments[arg]= site.public_send(arg)
            else
              raise(
                Insite::Errors::PageInitError,
                "A required page argument is missing. #{args.class} was provided, but " \
                "this object did not respond to :#{arg}, which is necessary to build " \
                "a URL for the #{self.class.name} page.\n\n#{caller.join("\n")}"
              )
            end
          else
            # Do nothing here yet.
          end
        end
      elsif @required_arguments.empty? && args # If there are no required arguments then nothing should be provided.
        raise(
          Insite::Errors::PageInitError,
          "#{args.class} was provided as a #{self.class.name} initialization argument, " \
          "but the page URL doesn't require any arguments.\n\n#{caller.join("\n")}"
        )
      else
        # Do nothing here yet.
      end

      @url = @url_template.expand(@arguments).to_s
      @page_features ||= []
      @page_features.each do |fname|
        begin
          klass = fname.to_s.camelize.constantize
        rescue NameError => e
          klass = self.class.const_get fname.to_s.camelize
        end

        self.class_eval do
          #klass = fname.to_s.camelize.constantize
          if klass.alias
            define_method(klass.alias) do
              klass.new(self)
            end
          else
            define_method(fname) do
              klass.new(self)
            end
          end
        end
      end

      @site.most_recent_page = self
      unless on_page?
        if navigation_disabled?
          raise(
            Insite::Errors::PageNavigationNotAllowedError,
            "Navigation is intentionally disabled for the #{self.class.name} page. " \
            "You can only call the accessor method for this page when it's already " \
            "being displayed in the browser.\n\nCurrent URL:" \
            "\n------------\n#{@site.browser.url}\n\n#{caller.join("\n")}"
          )
        end

        visit
      end
    end

    # Custom inspect method so that console output doesn't get in the way when debugging.
    def inspect
      "#<#{self.class.name}:#{object_id} @url_template=#{@url_template.inspect}>"
    end

    def navigation_disabled?
      @page_attributes.include? :navigation_disabled
    end

    def on_page?
      url = @browser.url

      if @url_matcher
        if @url_matcher =~ url
          return true
        else
          return false
        end
      elsif @url_template.match(url)
        if @arguments.empty?
          return true
        else
          if pargs = @url_template.extract(Addressable::URI.parse(url))
            pargs = pargs.with_indifferent_access
            @required_arguments.all? do |k|
              pargs[k] == @arguments[k] ||
              pargs[k] == @arguments[k].to_s ||
              !@arguments[k] && pargs[k] # Don't complain if arg is not explicit.
            end
          end
        end
      elsif @url_template.match(url.split(/(\?|#|\/$)/)[0])
        if @arguments.empty?
          return true
        else
          if pargs = @url_template.extract(Addressable::URI.parse(url))
            pargs = pargs.with_indifferent_access
            @required_arguments.all? { |k| pargs[k] == @arguments[k].to_s }
          end
        end
      else
        false
      end
    end

    # Refreshes the page.
    def refresh
      @browser.refresh
      self
    end

    # Returns the page title displayed by the browser.
    def title
      @browser.title
    end

    # Reloads the page (No need to call this method for initial navigation, which
    # happens automatically when the page is first initialized.)
    #
    # Raises an Insite::Errors::PageNavigationNotAllowedError when
    # navigation has been disabled for the page.
    #
    # Raises an Insite::Errors::WrongPageError if the specified page
    # isn't getting displayed after navigation.
    def visit
      if navigation_disabled?
        raise(
          Insite::Errors::PageNavigationNotAllowedError,
          "Navigation has been disabled for the #{self.class.name} page. This was " \
          "done when defining the page's class and usually means that the page can't " \
          "be reached directly through a URL and requires some additional work to access."
        )
      end

      2.times do
        begin
          @browser.goto(@url)
          break
        rescue Net::ReadTimeout => e
          sleep 3
        end
      end

      if @url_matcher
        unless on_page?
          raise(
            Insite::Errors::WrongPageError,
            "Navigation check failed after attempting to access the #{self.class.name} page. " \
            "This page has a URL matcher (a regular expression) defined for it. When a URL " \
            "matcher is defined it is used in place of the URL template that is normally used " \
            " to check for page display (URL template was still used for navigation.)" \
            "\n\nURL after navigation:\n#{@browser.url}" \
            "\n\nPage URL matcher that failed: #{@url_matcher}"
          )
        end
      else
        unless on_page?
          raise(
            Insite::Errors::WrongPageError,
            "Navigation check failed after attempting to access the #{self.class.name} page. " \
            "Current URL #{@browser.url} did not match #{@url_template.pattern}"
          )
        end
      end

      @site.most_recent_page = self
      self
    end

    # def respond_to_missing?(mth, include_priv = false)
    #   respond_to?(mth, include_priv)
    # end
  end
end
