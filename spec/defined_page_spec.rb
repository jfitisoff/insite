# TODO: Page tests need to be separated from site tests.

require_relative 'support/spec_helper'
require_relative 'support/ruby_lang_site'

describe Insite::DefinedPage do
  before(:all) do
    @s = RubyLangSite.new 'https://www.ruby-lang.org/', language_code: 'en'
    @s.open
  end

  after(:all) { @s.close }

  let!(:page) { @s.home_page }

  it "returns true for #defined?" do
    expect(page.defined?).to eq true
  end

  it "returns a selenium driver when #driver is called" do
    expect(page.driver).to be_instance_of Selenium::WebDriver::Chrome::Driver
  end

  it "returns an HTML string when #html is called" do
    expect(Nokogiri::HTML(page.html)).to be_instance_of Nokogiri::HTML::Document
  end

end
