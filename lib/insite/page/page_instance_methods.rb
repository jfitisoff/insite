module Insite
  module PageInstanceMethods
    attr_reader :arguments, :browser, :has_fragment, :page_attributes, :page_elements, :page_features, :page_url, :query_arguments, :required_arguments, :site, :url_template, :url_matcher, :widget_elements

    include CommonMethods
    alias_method :update_page, :update_object

    def describe
      self.class.describe
    end

    def defined?
      true
    end

    def driver
      @browser.driver
    end

    # There's no need to ever call this directly. Initializes a page object within the context of a
    # site object. Takes a site object and a hash of configuration arguments. The site object will
    # handle all of this for you.
    def initialize(site, args = nil)
      @widget_elements = self.class.widget_elements ||= []
      # @widget_methods  = self.class.widget_methods ||= []
      @browser = site.browser
      @page_attributes = self.class.page_attributes
      @page_url = self.class.page_url
      @page_elements = self.class.page_elements
      # TODO: Clean this up
      @page_features = self.class.instance_variable_get(:@page_features)
      @required_arguments = self.class.required_arguments
      @site = site
      @url_matcher = self.class.url_matcher
      @url_template = self.class.url_template
      @query_arguments = self.class.query_arguments
      @has_fragment    = self.class.has_fragment

      # Try to expand the URL template if the URL has parameters.
      @arguments = {}.with_indifferent_access # Stores the param list that will expand the url_template after examining the arguments used to initialize the page.
      if @required_arguments.present? && !args
        @required_arguments.each do |arg|
          if @site.respond_to?(arg)
            @arguments[arg]= site.public_send(arg)
          elsif @site.arguments[arg]
            @arguments[arg]= @site.arguments[arg]
          else
            raise PageInitError, "No arguments provided when attempting to initialize #{self.class.name}. This page object requires the following arguments for initialization: :#{@required_arguments.join(', :')}.\n\n#{caller.join("\n")}"
          end
        end
      elsif @required_arguments.present?
        @required_arguments.each do |arg| # Try to extract each URL argument from the hash or object provided, OR from the site object.
          if args.is_a?(Hash) && args.present?
            args = args.with_indifferent_access

            if args[arg] #The hash has the required argument.
              @arguments[arg]= args[arg]
            elsif @site.respond_to?(arg)
              @arguments[arg]= site.public_send(arg)
            else
              raise PageInitError, "A required page argument is missing. #{args.class} was provided, but this object did not respond to :#{arg}, which is necessary to build an URL for the #{self.class.name} page.\n\n#{caller.join("\n")}"
            end
          elsif args # Some non-hash object was provided.
            if args.respond_to?(arg) #The hash has the required argument.
              @arguments[arg]= args.public_send(arg)
            elsif @site.respond_to?(arg)
              @arguments[arg]= site.public_send(arg)
            else
              raise PageInitError, "A required page argument is missing. #{args.class} was provided, but this object did not respond to :#{arg}, which is necessary to build an URL for the #{self.class.name} page.\n\n#{caller.join("\n")}"
            end
          else
            # Do nothing here yet.
          end
        end
      elsif @required_arguments.empty? && args # If there are no required arguments then nothing should be provided.
        raise PageInitError, "#{args.class} was provided as a #{self.class.name} initialization argument, but the page URL doesn't require any arguments.\n\n#{caller.join("\n")}"
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
          raise PageNavigationNotAllowedError, "Navigation is intentionally disabled for the #{self.class.name} page. You can only call the accessor method for this page when it's already being displayed in the browser.\n\nCurrent URL:\n------------\n#{@site.browser.url}\n\n#{caller.join("\n")}"
        end
        visit
      end
    end

    # Custom inspect method so that console output doesn't get in the way when debugging.
    def inspect
      "#<#{self.class.name}:#{object_id} @url_template=#{@url_template.inspect}>"
    end

    def method_missing(mth, *args, &block)

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
            @required_arguments.all? { |k| pargs[k] == @arguments[k].to_s }
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

    def navigation_disabled?
      @page_attributes.include? :navigation_disabled
    end

    # Refreshes the page.
    def refresh
      @browser.refresh
      self
    end

    # Returns the title displayed in the browser.
    def title
      @browser.title
    end

    # Navigates to the page that it's called on. Raises a SiteObject::PageNavigationNotAllowedError when
    # navigation has been disabled for the page. Raises a SiteObject::WrongPageError if the
    # specified page isn't getting displayed after navigation.
    def visit
      if navigation_disabled?
        raise PageNavigationNotAllowedError, "Navigation has been disabled for the #{self.class.name} page. This was done when defining the page class and usually means that the page can't be reached directly through a URL and requires some additional work to access."
      end

      @browser.goto(@url)

      if @url_matcher
        raise WrongPageError, "Navigation check failed after attempting to access the #{self.class.name} page. Current URL #{@browser.url} did not match #{@url_template.pattern}. A URL matcher was also defined for the page and the secondary check against the URL matcher also failed. URL matcher: #{@url_matcher}" unless on_page?
      else
        raise WrongPageError, "Navigation check failed after attempting to access the #{self.class.name} page. Current URL #{@browser.url} did not match #{@url_template.pattern}" unless on_page?
      end

      @site.most_recent_page = self
      self
    end
  end
end
