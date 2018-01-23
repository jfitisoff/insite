# Page objects are containers for all of the functionality of a page that you want to expose for testing
# purposes. When you create a page object you define a URL to access it, elements for all of the page
# elements that you want to work with as well as higher level methods that use those elements to perform
# page operations.
#
# Here's a very simple account edit page example that has two fields and one button and assumes
# that you've defined a site object called 'ExampleSite.'
#
#  class AccountDetailsEditPage < ExampleSite::Page
#    set_url "/accounts/{account_code}/edit" # Parameterized URL.
#
#    element(:first_name)   {|b| b.text_field(:id, 'fname') } # text_field is a Watir method.
#    element(:last_name)    {|b| b.text_field(:id, 'fname') } # text_field is a Watir method.
#    element(:save)         {|b| b.button(:id, 'fname') }     # text_field is a Watir method.
#
#    def update(fname, lname) # Very simple method that uses the page elements defined above.
#      first_name.set fname
#      last_name.set  lname
#      save.click
#    end
#  end
#
# The URL defined in the example above is "parameterized" ({account_code} is a placeholder.)
# You don't need to specify parameters for a URL, but if you do you need to call the page with a hash
# argument. To use the page after initializing an instance of the site object:
#
#  site.account_details_edit_page(account_code: 12345)
#
# Pages only take arguments if the URL is parameterized.
#
# Note that in the example above that there's no explicit navigation call. This is because the site will
#look at its current URL and automatically navigate to the page if it's not already on it.
#
# Here's a simple page object for the rubygems.org search page. Note that no page URL is
# defined using the PageObject#set_url method. This is because the page URL for the landing page is
# the same as the base URL for the site. When a page URL isn't explicitly defined the base URL is used
# in its place:
#
#  class LandingPage < RubyGems::Page
#    element(:search_field)  { |b| b.browser.text_field(:id, 'home_query') }
#    element(:search_submit) { |b| b.browser.input(:id, 'search_submit')   }
#
#    def search(criteria)
#      search_field.set('rails')
#      search_submit.click
#      expect_page(SearchResultsPage)
#    end
#  end
#
# Page objects aren't initialized outside of the context of a site object. When a site object is initialized
# it creates accessor methods for each page object that inherits from the site's page class. In the
# example above, the LandingPage class inherits from the RubyGems site object's page class so you'd
# be able to use it once you've initialized a RubyGems site:
#
#  site.landing_page.search("rails") # Returns an instance of the landing page after performing a search.
#
# Because the site object has accessor methods for all of its pages and page navigation is automatic
# it's not always necessary to specify a page object directly. But you can get one if need one:
#
#  page = site.some_page
#  =><SomePage>
module Insite
  module PageClassMethods
    attr_reader :has_fragment, :page_attributes, :page_elements, :page_features, :page_url, :url_matcher, :url_template
    attr_accessor :widget_elements

    include WatirMethods

    # Page features should be inheritable so that page templates work. So using cattr_accessor
    # to allow that. Older versions of active_support were acting a little strange though --
    # the cattr_accessor method wasn't getting recognized even though the requires were right.
    # So the rescue block below is there to cover that case where cattr_accessor isn't
    # getting recognized for some reason.
    begin
      cattr_accessor :page_features
    rescue NoMethodError => e
      Module.cattr_accessor :page_features
    end

    def describe
puts <<-EOF
Page Class:\t#{name} (#{__FILE__})
URL Template:\t#{@url_template.pattern}"
URL Matcher:\t#{@url_matcher || 'Not specified.'}

Page Elements:\n#{@page_elements.sort.map { |x| "  #{x}\n" }.join }
EOF
    end

    private
    def element_container(name, type, *args, &block)
      tmpklass = Class.new(ElementContainer) do
        self.class_eval(&block) if block_given?
      end
      cname = name.to_s.camelcase + 'Container'
      const_set(cname, tmpklass) unless const_defined? cname

      @page_elements ||= []
      @page_elements << name.to_sym

      define_method(name) do
        self.class.const_get(cname).send(:new, @site, @browser.send(type, *args))
      end
    end
    public

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

    # def page_element(name, klass = Section, &block)
    #   tmpklass = Class.new(klass) do
    #     self.class_eval(&block) if block_given?
    #   end
    #   const_set(name.to_s.camelcase, tmpklass) unless const_defined? name.to_s.camelcase
    #
    #   define_method(name.to_s.underscore) do
    #     tmpklass.new(page = self)
    #   end
    # end

    # Allows you to set special page attributes that affect page behavior. The two page
    # attributes currently supported are :navigation_disabled and :page_template:
    #
    # * When :navigation_disabled is specified as a page attribute, all automatic and
    #   manual browser navigation is disabled. If you call the page's page methods
    #   automatic navigation is turned off -- it won't automatically load the page for
    #   you. And it the method will raise a PageNavigationNotAllowedError if you call
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
    # If an unsupported attribute is specified a PageConfigError will be raised.
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
          raise PageConfigError, "Unsupported page attribute argument: #{arg} for #{self} page definition. Argument class: #{arg.class}. Arguments must be one or more of the following symbols: :navigation_disabled, :template."
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
    # '{language}' in this one. Siteobject uses the Addressable library, which supports this kind of
    # templating. When you template a value in the URL, the page object will allow you to specify the
    # templated value when it's being initialized. Here's an example of how this works using a news site.
    # Here's the base site object class:
    #
    #  class NewsSite
    #    include SiteObject
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
    # object is initialized with a port, subdomain, or any other argument you can use those values
    # when defining a page URL. Example:
    #
    #  class ConfigPage < MySite::Page
    #    set_url "/foo/{subdomain}/config"
    #  end
    #
    #  site = MySite.new(subdomain: 'foo')
    #  => <MySite:0x005434546511>
    #  site.configuration_page # No need to provide a subdomain here as long as the site object has it.
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
        args.each { |feature| @page_features << feature }
      elsif args.present?
        @page_features = args
      # else
      #   @page_features = []
      end
    end

    def widget_method(method_name, widget_symbol, widget_method, target_element)
      @widget_methods ||= []
      @widget_methods << method_name.to_sym unless @widget_methods.include?(method_name.to_sym)

      define_method(method_name) do |*args, &block|
        self.class.const_get(widget_symbol.to_s.camelize)
        .new(@site, @site.send(target_element))
        .send(widget_method, *args, &block)
      end
    end
  end
end
