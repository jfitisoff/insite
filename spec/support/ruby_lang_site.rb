require 'insite'
# require 'rspec'

require 'coveralls'
Coveralls.wear!

# save to CircleCI's artifacts directory if we're on CircleCI
require 'simplecov'
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], "coverage")
  SimpleCov.coverage_dir(dir)
end

SimpleCov.start

def new_session
  s = RubyLangSite.new 'https://www.ruby-lang.org', language_code: 'en'
  s.open
  s.home_page(language_code: 'en')
  s
end

# The site object for ruby-lang.org.
class RubyLangSite
  attr_accessor :language_code
  include Insite
end

# class MenuBar < RubyLangSite::Widget
# end
#
# class Post < RubyLangSite::Widget
#   def title
#     h3.text
#   end
#
#   def summary
#     element(xpath: ".//p").text
#   end
#
#   def info
#     element(:class, 'post-info').text
#   end
# end

# Page Template. This is just a container class to store common features. Because
# it's a template it can't be accessed directly -- no page accessor method gets
# created for it. Instead, Other page classes inherit from it. You can have
# multiple page templates.
class RubyLangTemplate < RubyLangSite::Page
  set_attributes :page_template # Page template, so no accessor method for this page

  # menu_bar :header, :div, id: 'header_content'
  # menu_bar :footer, :div, id: 'footer'
end

# Models the page that users first see when they access the site. The landing page will
# display summaries of the four most recent news posts. You can click on these summaries to
# drill down to a page that contains the complete news post. The landing page also has links
# to navigate to the news page, which has a larger selection of news posts (the last ten
# most recent posts.)
class HomePage < RubyLangTemplate
  # Sets a templated URL that will be used for navigation (and for URL matching if a URL
  # matcher isn't provided.)
  set_url "/{language_code}/"

  # Use the Posts widget defined earlier.
  # posts :posts, :divs, :class, 'post'
end

# Models the news page, which shows summaries of the last ten most recent posts. The user
# can drill down on these summaries to read the full story.
class NewsPage < RubyLangTemplate
  # Sets a templated URL that will be used for navigation (and for URL matching if a URL
  # matcher isn't provided.) See HeaderBar and FooterBar page features defined above.
  set_url "/{language_code}/news/"


  # Use the Posts widget defined earlier.
  # posts :posts, :divs, :class, 'post'
end

# This page hosts a single, complete, news post. Users get to it by drilling down on
# summaries on the landing page or the news page.
class NewsPostPage < RubyLangTemplate
  set_url_matcher %r{/\S{2}/news/\d+/\d+/\d+/\S+/} #
  set_attributes  :navigation_disabled

  a :foo, text: /Download/i do
    def bar
      puts bar
    end

    a :c, index: 0
  end

  # post :post, :div, :class, 'post'
end
