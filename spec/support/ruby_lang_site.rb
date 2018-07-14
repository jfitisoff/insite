require 'insite'

def new_session
  s = RubyLangSite.new 'https://www.ruby-lang.org/', language_code: 'en', libs: 'libraries'
  s.open
  s.home_page(language_code: 'en')
  s
end

# The site object for ruby-lang.org.
class RubyLangSite
  attr_accessor :language_code
  include Insite
end

class MenuBar < RubyLangSite::Component
end

class Post < RubyLangSite::Component
  select_by tag_name: 'div', class: 'post'

  h3 :post_heading #, index: 0

  def post_title
    h3.text
  end

  def summary
    element(xpath: ".//p").text
  end

  def info
    element(:class, 'post-info').text
  end
end

# Page Template. This is just a container class to store common features. Because
# it's a template it can't be accessed directly -- no page accessor method gets
# created for it. Instead, Other page classes inherit from it. You can have
# multiple page templates.
class RubyLangTemplate < RubyLangSite::Page
  set_attributes :page_template # Page template, so no accessor method for this page

  menu_bar :page_header, tag_name: 'div', id: 'header_content'
  menu_bar :page_footer, tag_name: 'div', id: 'footer'
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


  def args_and_block(*args, &block)
    __method__
  end

  def args_only(*args)
    __method__
  end

  def block_only(&block)
    __method__
  end

  def method_only
    __method__
  end
end

# Models the news page, which shows summaries of the last ten most recent posts. The user
# can drill down on these summaries to read the full story.
class NewsPage < RubyLangTemplate
  # Sets a templated URL that will be used for navigation (and for URL matching if a URL
  # matcher isn't provided.) See HeaderBar and FooterBar page features defined above.
  set_url "/{language_code}/news/"

  # Use the Posts component defined earlier.
  # posts :posts, :divs, :class, 'post'
end

# This page hosts a single, complete, news post. Users get to it by drilling down on
# summaries on the landing page or the news page.
class NewsPostPage < RubyLangTemplate
  set_url_matcher %r{/\S{2}/news/\d+/\d+/\d+/\S+/} #
  set_attributes  :navigation_disabled

  a :foo, text: /Download/i do
    def bar
      puts 'bar'
    end

    a :c, index: 0
  end
  a :d, index: 0
  # post :post, :div, :class, 'post'
end

class FooAttrPage < RubyLangTemplate
  set_url "/{foo}/about/"
end

# Test page to confirm that missing args can be pulled from site args if
# they're included there.
class LibrariesPage < RubyLangTemplate
  set_url "/en/{libs}/"
end

https://www.ruby-lang.org/en/libraries/
class NoAttrPage < RubyLangTemplate
  set_url "/en/community/"
end

class TestingPageNavDisabledOld < RubyLangTemplate
  set_attributes :navigation_disabled
  set_url "/en/security/"
end

class TestingPageNavDisabledNew < RubyLangTemplate
  set_attributes :navigation_disabled
  set_url "/en/security/"
end

class TestingPageNoArgs < RubyLangTemplate
  set_url "/en/"
end

class TestingPageHasFrag < RubyLangTemplate
  set_url "/en/test#frag"
end

class TestingPageBadMatcher < RubyLangTemplate
  set_url_matcher /invalid/
end

class TestingPageFullURL < RubyLangTemplate
  set_url "https://rubygems.org"
  set_url_matcher /rubygems.org/
end

class BadSite
  include Insite
end

# class SiteWithBadPageMatcher
#   include Insite
#
#   class TestingPageStringMatcher < RubyLangTemplate
#     set_url_matcher 'whoops'
#   end
# end
# class BadPage < BadSite::Page
#   set_url_matcher 'invalid'
# end

class EmptySite
  include Insite
end

class GoogleSite
  include Insite
end

class SearchPage < GoogleSite::Page
end

class GithubSite
  include Insite
end

class ExplorePage < GithubSite::Page
  set_url '/explore'
end

class TestingPageEmptyURL < GithubSite::Page
  # set_url ''
end

class StripeSite
  include Insite
end

class StripeConnectPage < StripeSite::Page
  set_url "https://connect.stripe.com/oauth/authorize{?params*}"
  set_attributes :navigation_disabled

  link :sign_in, text: /Sign in/i
end

class Lang
  attr_accessor :language

  def initialize(language)
    @language = language
  end
end

# This class adds a little bit of functionality to the Post class it inherits
# from.
class PostSummary < Post

  def continue_reading
    links.last
  end
end
