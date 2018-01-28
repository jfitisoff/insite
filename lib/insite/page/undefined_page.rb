class UndefinedPage
  attr_reader :arguments, :browser, :has_fragment, :page_attributes, :page_elements, :page_features, :page_url, :query_arguments, :required_arguments, :site, :url_template, :url_matcher

  include Insite::CommonMethods

  # Always returns false.
  def defined?
    false
  end

  # Returns page HTML as a string.
  def html
    @browser.html
  end

  def initialize(site)
    @site.manage_browser

    @site    = site
    @browser = @site.browser
    @url     = @site.browser.url
  end

  # Returns a string representation of the undefined page.
  def inspect
    "#<#{self.class.name}:#{object_id} @url=#{@browser.url}>"
  end

  # TODO: Do the same cache check that's done for a defined page and reapply the
  # method if the cache is updated and the new page DOES respond to the method.
  def method_missing(mth, *args, &block)
    raise NoMethodError, "#{self.class} does not support #{mth}. Currently displayed page: #{page.class}. URL at failure: #{@browser.url}"
  end

  # Returns a Nokogiri object for the page HTML.
  def nokogiri
    @site.nokogiri
  end

  # Similar to the method that you can call on a page object you've defined (but always
  # returns false since the Undefined page class is only returned when the current page
  # doesn't match up to any page that you've actually defined.
  def on_page?
    browser_check(@browser)
    false
  end

  # Returns an empty Array (since the page hasn't been defined.)
  def page_elements
    []
  end
  alias_method :widget_elements, :page_elements

  # Returns the current URL.
  def url
    @browser.url
  end

  # Returns the title displayed in the browser.
  def title
    @browser.title
  end
end
