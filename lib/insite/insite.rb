require 'timeout'

# Usage:
#  require 'insite'
#
#  class MySite
#    include Insite
#  end
module Insite
  attr_reader :base_url, :unique_methods, :browser_type
  attr_accessor :pages, :browser, :arguments, :most_recent_page

  # Automatically sets up a Page class when Insite is included. Probably overkill
  # but it protects against the case where two different sites are used at the
  # same time: Each site will use its own page objects only.
  def self.included(base)
    mod = Module.new
    base.const_set('WidgetMethods', mod)

    klass = Class.new(DefinedPage)
    base.const_set('Page', klass)
    base::send(:extend, WidgetMethods)

    klass = Class.new(UndefinedPage)
    base.const_set('UndefinedPage', klass)
  end

  # Returns true if there's an open browser (that's also responding.) False if not.
  def browser?
    begin
      @browser.exists?
    rescue => e
      false
    end
  end

  # Closes the site object's browser/driver.
  def close
    @browser.close
  end

  def describe
puts <<-EOF
Wrapper class for all pages defined for the site.
Site:\t#{self.class} (#{__FILE__})
Base URL:\t#{@base_url}
Browser:\t#{@browser}
Current Page:\t#{page.class}

Page Accessor Methods (Use '?' with name to check for presence.)
-----------------------------------------------------------------
#{
  tmp = []
  max = pages.map(&:to_s).max { |x| x.length }
  if max.length > 40
    pages.map(&:to_s).sort.map(&:underscore).join("\n")
  else
    pages.map(&:to_s).sort.map(&:underscore).each_slice(2) do |arr|
      tmp << arr[0].to_s.ljust(40) + arr[1].to_s.ljust(40)
    end
    tmp.join("\n")
  end
}
EOF
  end

  # Returns a Selenium driver object.
  def driver
    @browser.driver
  end

  # Returns true if there's an open driver (that's also responding.) False if not.
  def driver?
    browser?
  end

  # Creates a site object, which will have accessor methods for all pages that
  # you have defined for the site. This object takes a hash argument. There is
  # only one required value (the base_url for the site.) Example:
  #
  #  class MySite
  #    include Insite
  #  end
  #
  #  # Note: This base URL can be overridden when defining a page.
  #  site = MySite.new("https://foo.com")
  #
  # You can also specify any other arguments that you want for later use:
  #
  #  site = MySite.new("http://foo.com", arg1, arg2, key1: val1, key2: val2)
  #
  #  site.foo
  #  => true
  #  site.bar
  #  => 1
  # TODO: Sort args.
  def initialize(base_url, **hsh)
    @arguments       = hsh.with_indifferent_access
    @base_url        = base_url
    @browser_type    = (@arguments[:browser] ? @arguments[:browser].to_sym : nil)
    @pages           = self.class::DefinedPage.descendants.reject { |p| p.page_template? }

    # Set up accessor methods for each page and page checking methods..
    @pages.each do |current_page|
      unless current_page.page_template?
        current_page.set_url_template(@base_url)

        if current_page.url_matcher
          unless current_page.url_matcher.is_a? Regexp
            raise Insite::Errors::PageConfigError,
            "A url_matcher was defined for the #{current_page} page but it was not a " \
            "regular expression. Check the value provided to the set_url_matcher method " \
            "in the class definition for this page. Object provided was a " \
            "#{current_page.url_matcher.class.name}"
          end
        end

        self.class.class_eval do
          define_method(current_page.to_s.underscore) do |args = nil, block = nil|
            current_page.new(self, args)
          end

          define_method("#{current_page.to_s.underscore}?") do
            on_page? current_page
          end
        end
      end
    end

    visited = Set.new
    tmp = @pages.map {|p| p.instance_methods }.flatten
    tmp.each do |element|
      if visited.include?(element)
       else
        visited << element
      end
    end
    @unique_methods = visited
  end

  # Custom inspect method so that console output doesn't get in the way when debugging.
  def inspect
    "#<#{self.class.name}:0x#{object_id}\n @base_url=\"#{@base_url}\" " \
    "@most_recent_page=#{@most_recent_page}>"
  end

  # In cases where Insite doesn't recognize a method call it will try to do the following:
  # - Delegate the method call to the most recently accessed page, which is stored in
  #   Insite#most_recent_page.
  #
  # - If the cached page doesn't respond to the method, Insite will update the cache and
  #   then try to delegate the method again.
  #
  # If delegation doesn't work then a NoMethodError will be raised with some details about
  # what was attempted.
  def method_missing(sym, *args, &block)
    original_page = @most_recent_page
    if original_page.respond_to?(sym)
      original_page.public_send(sym, *args, &block)
    else
      new_page = page
      if new_page.respond_to?(sym)
        page.public_send(sym, *args, &block)
      else
        raise(
          NoMethodError,
          "Unable to apply method. #{self.class}##{sym} is not supported. " \
          "#{original_page.class}##{sym} is not supported.\n\nCurrent URL: " \
          "#{@browser.url}\n\n",
          caller
        )
      end
    end
  end

  # Returns true or false depending on whether the specified page is displayed. You can use a page
  # object or a PageObject class name to identify the page you are looking for. Examples:
  #
  #  page = site.account_summary_page
  #  =>#<AccountSummaryPage:70341126478080 ...>
  #  site.on_page? page
  #  =>true
  #
  #  site.on_page? AccountSummaryPage
  #  =>true
  #
  # If no arguments are provided, the currently displayed page will be checked. If a
  # matching page object can be found then true will be returned. if there's no matching
  # page object, false will be returned.
  #
  # Insite caches the most recently accessed page. This method updates that cached value,
  # which can be accessed by calling Insite#most_recent_page.
  def on_page?(page_arg = nil)
    if page_arg
      if pages.include?(page_arg) # See if the currently displayed page has the same class.
        if @most_recent_page == page_arg && @most_recent_page.on_page?
          true
        else
          @most_recent_page = page
          @most_recent_page.class == page_arg
        end
      else # See if the currently displayed page is the same type of object.
        if @most_recent_page == page_arg
          @most_recent_page.on_page?
        else
          @most_recent_page = page
          @most_recent_page == page_arg
        end
      end
    else # Just see if the currently displayed page has been defined.
      if @most_recent_page.defined? && @most_recent_page.on_page?
        true
      else
        @most_recent_page = page
        @most_recent_page.on_page?
      end
    end
  end

  # Opens a browser. The arguments used here get passed down to the browser
  # constructor. Example:
  #  s = SomeSite.new("http://foo.com")
  #  s.open :firefox
  def open(btype = nil, *args)
    btype ||= @browser_type

    @browser = Watir::Browser.new(btype, *args)
    self
  end

  # Looks at the page currently being displayed in the browser and tries to
  # return a page object for it. Does this by looking at the currently displayed
  # URL in the browser.
  #
  # If a matching page can't be found then Insite will return an "undefined page"
  # object. See the Un class for more details.
  def page
    return @most_recent_page if @most_recent_page && @most_recent_page.on_page?
    url = @browser.url
    found_page = nil
    @pages.each do |pg|
      if pg.url_matcher && pg.url_matcher =~ url
        found_page = pg
      elsif pg.query_arguments && pg.url_template.match(url)
        found_page = pg
      elsif !pg.query_arguments && pg.url_template.match(url.split(/(\?|#)/)[0])
        found_page = pg
      end

      break if found_page
    end

    if found_page && !found_page.required_arguments.empty?
      if hsh = found_page.url_template.extract(url)
        return found_page.new(self, found_page.url_template.extract(url))
      else
        return found_page.new(self, found_page.url_template.extract(url.split(/(\?|#)/)[0]))
      end
    elsif found_page
      return found_page.new(self)
    else
      return UndefinedPage.new(self)
    end
  end

  def text
    @browser.text
  end

  # Returns an Addressable::URI object for the current browser URL.
  def uri
    Addressable::URI.parse(@browser.url)
  end

  # Returns the current browser URL.
  def url
    @browser.url
  end

  at_exit { @browser.close if @browser }
end
