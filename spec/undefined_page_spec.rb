require_relative 'support/spec_helper'
require_relative 'support/ruby_lang_site'

describe Insite::UndefinedPage do
  before(:all) do
    @s = RubyLangSite.new 'https://www.ruby-lang.org/', language_code: 'en'
    @s.open
    @s.browser.goto "https://www.google.com"
  end

  after(:all) { @s.close }

  let!(:page) { @s.page }

  it "is returned for an unrecognized URL" do
    expect(page).to be_instance_of Insite::UndefinedPage
  end

  it "returns false for #defined?" do
    expect(page.defined?).to eq false
  end

  it "returns a selenium driver when #driver is called" do
    expect(page.driver).to be_instance_of Selenium::WebDriver::Chrome::Driver
  end

  it "returns an HTML string when #html is called" do
    expect(Nokogiri::HTML(page.html)).to be_instance_of Nokogiri::HTML::Document
  end

  it "returns a custom NoMethodError when an invalid method is called" do
    expect { page.bananas }.to raise_error NoMethodError # msg later
  end

  it "returns a Nokogiri document when #nokogiri is called" do
    expect(page.nokogiri).to be_instance_of Nokogiri::HTML::Document
  end

  it "returns false for #on_page?" do
    expect(page.on_page?).to eq false
  end

  it "returns an empty array for #page_elements" do
    expect(page.page_elements).to be_instance_of Array
  end

  it "returns a URL string for #url" do
    expect(page.url).to eq page.browser.url
  end

  it "returns the page title for #title" do
    expect(page.title).to eq page.browser.title
  end
end
