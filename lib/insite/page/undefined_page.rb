module Insite
  class UndefinedPage
    attr_reader :arguments, :browser, :has_fragment, :page_attributes, :page_elements, :page_features, :page_url, :query_arguments, :required_arguments, :site, :url_template, :url_matcher

    def initialize(site)
      @site    = site
      @browser = @site.browser
      @url     = @site.browser.url
    end

    def defined?
      false
    end

    def inspect
      "#<#{self.class.name}:#{object_id} @url=#{@browser.url}>"
    end

    def method_missing(mth, *args, &block)
      raise NoMethodError, "#{self.class} does not support #{mth}. Current Page: #{page.class}. URL at failure: #{@browser.url}"
    end

    # Similar to the method that you can call on a page object you've defined (but always
    # returns false since the Undefined page class is only returned when the current page
    # doesn't match up to any page that you've actually defined.
    def on_page?
      false
    end

    # Returns the browser's URL.
    def url
      @browser.url
    end

    # Returns the title displayed in the browser.
    def title
      @browser.title
    end
  end
end
