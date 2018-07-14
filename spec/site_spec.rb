require_relative 'support/spec_helper'
require_relative 'support/ruby_lang_site'

# TODO: Needs organizing
describe "page objects" do

  before(:all) do
    @github = GithubSite.new('https://github.com/')
    @github.open
    @site = RubyLangSite.new(
      "https://www.ruby-lang.org/",
      language_code: "en",
      libs: "libraries"
    )
    @site.open
  end

  before(:each) do
    @site.arguments[:language] = 'en' # Because one test overrides the value set at init.
  end

  after(:all) do
    @site.close
    @github.close
  end

  context "site methods" do
    it "returns false for #browser? when browser doesn't exist" do
      expect(GithubSite.new('https://github.com/').browser?).to eq false
    end

    it "returns a driver object when #driver is called" do
      expect(@github.driver).to be_instance_of Selenium::WebDriver::Chrome::Driver
    end

    it "returns false for #driver? when driver doesn't exist" do
      expect(GithubSite.new('https://github.com/').driver?).to eq false
    end
  end

  it "raises when the visit method is called on a page that does not allow navigation" do
    @site.news_page.posts.first.link.click
    expect(@site.news_post_page?).to be_truthy
    p = @site.page
    @site.news_page
    expect { p.visit }.to raise_error Insite::Errors::PageNavigationNotAllowedError
  end

  it "raises a PageConfigError when an invalid page attribute is defined" do
    klass = Class.new(RubyLangSite::Page)
    expect { klass.send(:set_attributes, :bar) }.to raise_error Insite::Errors::PageConfigError
  end

  it "overrides the base_url when the page URL is fully qualified" do
    klass = Class.new(RubyLangSite::Page)
    klass.send(:set_url, "https://google.com")
    expect(klass.page_url).to eq "https://google.com"
  end

  it "raises a PageInitError when no args are provided for page with required argument" do
    @site.arguments[:language] = nil
    expect { @site.foo_attr_page }.to raise_error Insite::Errors::PageInitError
  end

  it "raises a PageInitError when hash args don't include required param" do
    @site.arguments[:language] = nil
    expect { @site.foo_attr_page wrong: 'argument' }.to raise_error Insite::Errors::PageInitError
  end

  it "raises a PageInitError when object arg doesn't respond to required param" do
    @site.arguments[:language] = nil
    expect { @site.foo_attr_page 'whoops' }.to raise_error Insite::Errors::PageInitError
  end

  it "supports a custom inspect method" do
    expect(@site.home_page.inspect.length).to be > 0
  end

  it "can tell it's on the page when there are no page args" do
    expect(@site.testing_page_no_args.on_page?).to be_truthy
  end

  it "pulls from site args when a page arg is missing" do
    expect(@site.libraries_page).to be_truthy
  end

  it "uses URL fragment for a page url template that specifies one" do
    expect(@site.testing_page_has_frag.page_url).to match %r{/en/test#frag$}
  end

  it "strips out a URL fragment when doing matching for a page url template that doesn't specify one" do
    @site.home_page
    @site.browser.goto @site.browser.url + "#/foo"
    expect(@site.home_page).to be_on_page
  end

  it "visits a page" do
    expect(@site.home_page.visit.browser.text).to match /A Programmer's Best Friend/i
  end

  it "refreshes a page" do
    expect(@site.home_page.refresh.browser.text).to match /A Programmer's Best Friend/i
  end

  it "raises an error when a page matcher doesn't match when the page is visited" do
    expect {
      @site.testing_page_bad_matcher.visit
    }.to raise_error Insite::Errors::WrongPageError
  end

  it "defines a ? method to verify page display" do
    @site.home_page
    expect(@site.home_page?).to be_truthy
    expect(@site.news_page?).to be_falsey
  end

  it "defines a custom inspect method" do
    expect { @site.inspect }.to_not raise_error
  end

  it "calls a page element" do
    expect(
      @site.news_page.posts.first.post_heading
    ).to be_instance_of Insite::Heading
  end

  it "handles an empty page_url" do
    pending "seems like there's a bug here related to ruby-lang and github " \
            "both at same time."
    @github.testing_page_empty_url
    expect(@github.testing_page_empty_url?).to be_truthy
  end

  it "handles a fully qualified page_url" do
    @site.testing_page_full_url
    expect(@site.testing_page_full_url?).to be_truthy
  end

  it "can be initialized with a non hash argument" do
    lang = Lang.new('en')
    @site.home_page lang
  end

  it "raises when the page URL has no arguments but page arguments are provided" do
    expect { @site.no_attr_page foo: 'bar' }.to raise_error Insite::Errors::PageInitError
  end

end

describe "Site Object Delegation" do

  before(:all) do
    @site = RubyLangSite.new 'https://www.ruby-lang.org/', language_code: 'en'
    @site.open
  end

  after(:all) do
    @site.close
  end

  context "Delegation to Most Recent Page" do
    before(:each) { @site.home_page.visit }

    it "delegates unknown method with args and block down to most recent page" do
      expect(@site.args_and_block(1, 2) {'foo'}).to eq :args_and_block
    end

    it "delegates unknown method with block down to most recent page" do
      expect(@site.block_only {'foo'}).to eq :block_only
    end

    it "delegates unknown method with args down to most recent page" do
      expect(@site.args_only(1, 2)).to eq :args_only
    end

    it "delegates unknown method with no args or block down to most recent page" do
      expect(@site.method_only).to eq :method_only
    end

    it "hits method_missing when the page doesn't recognize delegated method" do
      expect { @site.invalid_method_call }.to raise_error NoMethodError
    end
  end

  context "Delegation after Finding Page" do
    before(:each) do
      @site.news_page.visit
      @site.browser.goto @site.base_url + 'en/'
    end

    it "delegates unknown method with args and block after it identifies new page" do
      expect(@site.args_and_block(1, 2) {'foo'}).to eq :args_and_block
    end

    it "delegates unknown method with block after it identifies new page" do
      expect(@site.block_only {'foo'}).to eq :block_only
    end

    it "delegates unknown method with args after it identifies new page" do
      expect(@site.args_only(1, 2)).to eq :args_only
    end

    it "delegates unknown method after it identifies new page" do
      expect(@site.method_only).to eq :method_only
    end

    it "hits method_missing when the page doesn't recognize delegated method" do
      expect { @site.invalid_method_call }.to raise_error NoMethodError
    end
  end
end
