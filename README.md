# insite
A page object library that treats a website as a related collection of pages.
Page objects are accessed via a site object. Currently supports Watir, Selenium
support in progress.

## Sample code for https://www.ruby-lang.org/en/:
```ruby
# Site object class.
class RubyLangSite
  attr_accessor :language_code
  include Insite
end

# Reusable widget.
class MenuBar < RubyLangSite::Widget
end

# Reusable widget.
class Post < RubyLangSite::Widget
  def title
    h3.text
  end

  def summary
    element(xpath: ".//p").text
  end

  def info
    element(:class, 'post-info').text
  end
end

# Page template for other pages.
class RubyLangTemplate < RubyLangSite::Page
  set_attributes :page_template

  menu_bar :header, :div, id: 'header_content'
  menu_bar :footer, :div, id: 'footer'
end

# Page class.
class HomePage < RubyLangTemplate
  set_url "/{language_code}/"
  posts :posts, :divs, :class, 'post'
end

# Page class.
class NewsPage < RubyLangTemplate
  set_url "/{language_code}/news/"
  posts :posts, :divs, :class, 'post'
end

# Page class.
class NewsPostPage < RubyLangTemplate
  set_url_matcher %r{/\S{2}/news/\d+/\d+/\d+/\S+/} #
  set_attributes  :navigation_disabled

  post :post, :div, :class, 'post'
end

# Utility method to create a site object and open a browser for it.
def new_session
  s = RubyLangSite.new 'https://www.ruby-lang.org', language_code: 'en'
  s.open
  s.home_page
  s
end
```

## Sample tests using the site defined above.
```ruby
require_relative 'support/ruby_lang_site'

describe "https://www.ruby-lang.org" do
  before(:all) { @s = new_session }
  after(:all)  { @s.close }

  let(:s) { @s }

  it "shows 4 news posts on the landing page" do
    expect(s.home_page.posts.length).to be >= 4
  end

  it "has a link to the News page in the header bar links" do
    expect(s.home_page.header.news_link.present?).to eq(true)
  end

  it "drills down to the News page via the header bar" do
    s.home_page.header.news
    expect(s.news_page?).to eq(true)
  end

  it "has a link to the News page in the footer bar links" do
    expect(s.home_page.footer.news_link.present?).to eq(true)
  end

  it "drills down to the News page via the footer bar" do
    s.home_page.footer.news
    expect(s.news_page?).to eq(true)
  end

  it "has same title for most recent post as the news page does" do
    home_page_title = s.home_page.posts[0].title
    news_page_title = s.news_page.posts[0].title
    expect(home_page_title).to eq(news_page_title)
  end

  it "drills down on the most recent post summary" do
    s.home_page.posts[0].continue_reading
    expect(s.news_post_page?).to eq(true)
  end
end
```
