require 'timeout'
require_relative 'methods/common_methods'

# Usage:
#  require 'insite'
#
#  class MySite
#    include Insite
#  end
module Insite
  attr_reader :base_url, :unique_methods, :browser_type, :site
  attr_accessor :pages, :browser, :arguments, :most_recent_page

  include CommonMethods

  def self.class_to_tag(klass)
    if klass.respond_to?(:collection) && klass.collection?
      (
        Watir.tag_to_class.key(klass) ||
        Watir.tag_to_class.key(CLASS_MAP.key(klass)) ||
        Watir.tag_to_class.key(CLASS_MAP.key(klass.collection_member_class))
      )
    else
      Watir.tag_to_class.key(klass) || Watir.tag_to_class.key(CLASS_MAP.key(klass))
    end
  end

  def self.tag_to_class(tag)
    CLASS_MAP[Watir.tag_to_class[tag.to_sym]] || Insite::HTMLElement
  end

  # Automatically sets up a Page class when Insite is included. Probably overkill
  # but it protects against the case where two different sites are used at the
  # same time: Each site will use its own page objects only.
  def self.included(base)
    mod = Module.new
    base.const_set('ComponentMethods', mod)

    klass = Class.new(DefinedPage)
    base.const_set('Page', klass)
    base::send(:extend, ComponentMethods)

    klass = Class.new(UndefinedPage)
    base.const_set('UndefinedPage', klass)

    class << base
      attr_reader :custom_tags
      @custom_tags = []
    end

    base.define_singleton_method(:set_custom_tags) do |*tags|
      @custom_tags ||= []
      tags.sort.each { |t| @custom_tags << t.to_s.downcase.dasherize }
    end
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
    @browser.close if browser?
  end

  # Returns a Selenium driver object.
  def driver
    @browser.driver
  end

  # Returns true if there's an open driver (that's also responding.) False if not.
  def driver?
    browser?
  end

  # def generate_tag_classes
  #   tags = []
  #   cli = Highline.new
  #
  #   loop do
  #     tags = (tags + find_non_standard_tags).uniq.sort
  #     cli.choose do |menu|
  #       menu.prompt "Found #{tags.length} non-standard tags. Choose one of the following options:"
  #       menu.choice(:list_tags) { puts tags.join(",\n") + "\n" }
  #       menu.choice(:continue)  {}
  #       menu.choice(:write_to_console) do
  #       end
  #       menu.choice(:exist_without_writing) { break }
  #
  #     end
  #   end
  # end

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
  def initialize(base_url = nil, hsh={})
    if hsh.include?(:scheme)
      @arguments = hsh.with_indifferent_access
    else
      base_url.match(/(https|http)/i)
      scheme = $1 || 'https'
      @arguments = hsh.merge({scheme: scheme}).with_indifferent_access
    end

    @site = self
    @base_url     = base_url
    @browser_type = (@arguments[:browser] ? @arguments[:browser].to_sym : nil)

    # Don't include the base page class or any page templates in the site's
    # pages. Those should never be used directly.
    @pages = self.class::DefinedPage.descendants.reject do |pg|
      pg.page_template? || pg == self.class::Page
    end

    # Builds generic components for custom tags.
    if self.class.custom_tags
      self.class.custom_tags.each do |tag|
        # TODO: Ditch string interpolation.
        self.class.class_eval %Q{
          class #{tag.underscore.camelize} < Component
            select_by tag_name: "#{tag}"
          end
        }
      end
    end

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

        # Update the site class with methods for each page that is defined.
        self.class.class_eval do

          # Returns a page object for the page.
          define_method(current_page.to_s.underscore) do |args = nil, block = nil|
            current_page.new(self, args)
          end

          # Returns true if the page is being displayed, false if not.
          define_method("#{current_page.to_s.underscore}?") do
            on_page? current_page
          end

          # Similar to the method above but attempts navigation prior to the page
          # check. Returns a boolean rather than a page object: true if the
          # right page was loaded successfully, false if not. A navigation attempt
          # always occurs when this method is called.
          #
          # The main benefit of this method is to make it easier to write test
          # scenarios for situations where you know navigation is going to fail
          # (Examples of this would be session timeouts or role/privilege
          # test scenarios.) Normally an Insite::Errors::WrongPageError is
          # automatically raised when a navigation attempt fails. So in order to
          # test these sorts of scenarios you'd have to do a little more work to
          # handle the exception. Examples in RSpec:
          #
          # The "hard" way:
          # expect {s.login_page }.to raise_error(Insite::Errors::WrongPageError)
          #
          # The same assert using this method:
          # expect(s.try_login_page).to be_truthy
          define_method("try_#{current_page.to_s.underscore}") do |args = nil, block = nil|
            begin
              current_page.new(self, args)
              true
            rescue Insite::Errors::WrongPageError => e
              return false
            end
          end
        end
      end
    end

    # Sort templates by variable count: Templates with more vars will be
    # prioritized. This will partially eliminate the potential for a match on
    # the wrong template when there are two or more templates that match the
    # URL.
    @pages = @pages.sort do |pg1, pg2|
      pg1.url_template.variables.length <=> pg2.url_template.variables.length
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

  def find_non_standard_tags
    @browser.elements(xpath: non_standard_tag_xpath).map do |e|
      e.html.match(/<(\S+?(?=[\s,>]))/)[1]
    end.uniq.sort
  end

  def html
    @browser.html
  end

  def html_tags
    %i(html title head body) + Insite::METHOD_MAP.values.flatten.each do |mth|
      elem = @browser.send(mth)
      elem.respond_to?(:selector) ? elem.selector.values.first.to_s : nil
    end.sort
  end

  def non_standard_tag_xpath
    "//*[#{html_tags.map { |sym| "not(local-name(.) = '#{sym}')" }.join(" and ") }]"
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
  def method_missing(mth, *args, &block)
    original_page = @most_recent_page

    if original_page.respond_to?(mth)
      original_page.public_send(mth, *args, &block)
    else
      new_page = page

      if new_page.respond_to?(mth)
        page.public_send(mth, *args, &block)
      elsif !new_page.defined?
        raise NoMethodError, "Could not apply #{mth}. The current page could not be " \
        "recognized. Current URL #{@browser.url}"
      else
        # TODO: Make it clearer where the method got called.
        raise(
          NoMethodError,
          "Unable to apply method call :#{mth}. The site object doesn't support it. " \
          "The currently displayed page (#{new_page}) doesn't support it either.\n" \
          "Page:\t\t#{new_page.class}\n" \
          "Current URL:\t#{@browser.url}\n\n",
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
    browser_platform = btype ||= @browser_type

    if browser_platform
      self.instance_variable_set(
        :@browser,
        Watir::Browser.new(browser_platform, *args)
      )
    else
      self.instance_variable_set(
        :@browser,
        Watir::Browser.new(*args)
      )
    end

    Watir.logger.level = :error
    self
  end

  # Looks at the page currently being displayed in the browser and tries to
  # return a page object for it. Does this by looking at the currently displayed
  # URL in the browser.
  #
  # If a matching page can't be found then Insite will return an "undefined page"
  # object. See the UndefinedPage class for more details.
  def page
    # 1.)
    # Before anything else, look to see if it's the most recent page:
    return @most_recent_page if @most_recent_page && @most_recent_page.on_page?
    process_browser
    url = @browser.url

    found_page = nil
    # 2.)
    # Ensure that static templates are always prioritized when attempting to
    # match, which will prevent the wrong template from getting matched in this
    # scenario:
    #  - "/accounts/{account_code}"
    #  - "/accounts/new"
    #
    # Start by working through the array from FRONT to BACK, since any static
    # templates will be at the front of the array. Stop when we start to see
    # templates whth vars (These will get handled in the next statement.)
    @pages.each do |pg|
      break if pg.url_template.variables.length > 0

      if pg.url_matcher && pg.url_matcher =~ url
        found_page = pg
      elsif pg.url_template.match(url)
        found_page = pg
      else
        next
      end

      break if found_page
    end

    # 3.) Now we've reached the templates that include one or more variables.
    # For these, we want to try to match on the templates with more variables.
    # This prevents an invalid match in the following situation and removes the
    # need to provide a URL matcher to override the URL template:
    # - "/accounts/{account_code}/edit"
    # - "/accounts/{account_code}"
    # Now work through all the array from BACK to FRONT, stopping when we reach
    # the point where we see templates without a var (since those were already
    # handled above.)
    @pages.reverse.each do |pg|
      break if pg.url_template.variables.length == 0

      if pg.url_matcher && pg.url_matcher =~ url
        found_page = pg
      elsif pg.url_template.match(url)
        found_page = pg
      else
        next
      end

      break if found_page
    end

    if found_page && found_page.required_arguments.present?
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

  def respond_to_missing?(mth, include_priv = false)
    # TODO: Page context changes.
    @most_recent_page.respond_to?(mth, include_priv) || super
  end

  def target
    @browser
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

  private
  def process_base_url(base)
    case base
    when /^(https\:|http\:)/
      base.sub(/^(http\:|https\:)/, "{scheme}:")
    when /^www\./
      base.sub(/^www\./, "{scheme}://")
    else
      "{scheme}://#{base}"
    end
  end
end
