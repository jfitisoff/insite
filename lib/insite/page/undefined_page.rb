module Insite
  class UndefinedPage
    attr_reader :arguments, :browser, :has_fragment, :page_attributes, :page_elements, :page_features, :page_url, :required_arguments, :site, :url_template, :url_matcher

    include Insite::CommonMethods
    extend  Insite::ComponentMethods
    include Insite::ComponentInstanceMethods
    # TODO: DOM methods.

    # Always returns false.
    def defined?
      false
    end

    def driver
      @browser.driver
    end

    def html
      @browser.html
    end

    def initialize(site)
      @site    = site
      @browser = process_browser
      @url     = @site.browser.url
    end

    # TODO: Do the same cache check that's done for a defined page and reapply the
    # method if the cache is updated and the new page DOES respond to the method.
    def method_missing(mth, *args, &block)
      raise NoMethodError, "Could not apply #{mth}. The current page couldn't " \
      "be recognized. Current URL #{@browser.url}"
    end

    # Returns a Nokogiri object for the page HTML.
    def nokogiri
      Nokogiri::HTML(html)
    end

    # Similar to the method that you can call on a page object you've defined (but always
    # returns false since the Undefined page class is only returned when the current page
    # doesn't match up to any page that you've actually defined.
    def on_page?
      false
    end

    # Returns an empty Array (since the page hasn't been defined.)
    def page_elements
      []
    end
    alias_method :component_elements, :page_elements

    # Returns the current URL.
    def url
      @browser.url
    end

    # Returns the page title displayed by the browser.
    def title
      @browser.title
    end
  end
end
