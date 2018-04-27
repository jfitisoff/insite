# insite
Insite is a page object library that treats a website as a related collection of pages. Page objects are accessed via a site object. The library currently supports Watir. Selenium support is in progress.

Note: Documentation is still a WIP and not everything is properly documented. More to come.

# Table of Contents
* [insite](https://github.com/jfitisoff/insite#insite)
   * [Site Object Model](https://github.com/jfitisoff/insite#site-object-model)
* [Basic Usage](https://github.com/jfitisoff/insite#basic-usage)
   * [Creating a site object](https://github.com/jfitisoff/insite#creating-a-site-object)
   * [Creating a page for a site](https://github.com/jfitisoff/insite#creating-a-page-for-a-site)
   * [Using a site object page.](https://github.com/jfitisoff/insite#using-a-site-object-page)
* [Features](https://github.com/jfitisoff/insite#features)
   * [Simplified Page Object Initialization and Navigation](https://github.com/jfitisoff/insite#simplified-page-object-initialization-and-navigation)
      * [Templated URLs and Support for Object Arguments](https://github.com/jfitisoff/insite#templated-urls-and-support-for-object-arguments)
      * [Overriding a URL Template for Navigation Purposes](https://github.com/jfitisoff/insite#overriding-a-url-template-for-navigation-purposes)
   * [No need to declare page object variables](https://github.com/jfitisoff/insite#no-need-to-declare-page-object-variables)
   * [Page Templates](https://github.com/jfitisoff/insite#page-templates)
   * [Page Widgets](https://github.com/jfitisoff/insite#page-widgets)
   * [Updating pages](https://github.com/jfitisoff/insite#updating-pages)
* [Sample code for <a href="https://www.ruby-lang.org/en/" rel="nofollow">https://www.ruby-lang.org/en/</a>:](https://github.com/jfitisoff/insite#sample-code-for-httpswwwruby-langorgen)
   * [Sample tests for www.ruby-lang.org](https://github.com/jfitisoff/insite#sample-tests-using-the-site-defined-above)

## Site Object Model
Page objects are the gold standard for browser automation. Using the Page Object Model, classes are defined for each page in a web application. These classes contain accessor methods for page elements, as well as higher-level methods that utilize these elements to provide support for more complex tasks.

By design, this model for test automation views a website as a collection of individual pages. But when we actually use a web app we generally think of it as an *app* and the pages fade into the background -- they're just part of the app that we're using.

Why not take that approach with UI automation? Focus on the app as a whole rather than a collection of individual pages? You could do that by creating another level of organization *above* the page objects for a site: something that represents the site
itself. That's the approach that this library takes.

# Basic Usage

## Creating a site object
```ruby
require 'insite'

class MySite
  include Insite
end
```

## Creating a page for a site
```ruby
# The set_url method is used to define a relative url.
class LoginPage < MySite::Page
  set_url '/login'

  text_field :email,    id: 'email'
  text_field :password, id: 'pwd'
  button :log_in_button, type: 'submit'

  # The update_page method takes a hash argument of element names and values and
  # then updates the page accordingly (it figures out what the element is and what
  # to do with the values.)
  def log_in(hsh = {})
    update_page hsh
    log_in_button.click
  end
end
```

## Using a site object page.
```ruby
# Create a site. Main argument is the "base_url" for the site being accessed (required.)
# The constructor also accepts optional hash args.
site = MySite.new "https://mysite.com"

# Start a browser.
site.open

# Navigate to login page and log in (more on navigation below.)
site.login_page.log_in email: 'foo@bar.com', password: 'PassW0rd8'
```

# Features

## Simplified Page Object Initialization and Navigation
Three main points worth noting before digging into how navigation works:
 * Browsers get initialized at the site level. The site object automatically passes the browser down to a page object as it gets initialized. So there's no need to feed a page object a browser object every time you need a page.

 * The site object automatically creates accessor methods for each page that you define for the site.

 * The site object pays close attention to the current browser URL and uses that to figure out if there's a matching page object for it.

Here's a fairly typical example of how navigation works with page objects. You create a new instance of a page, feeding it a browser object. Then you call some sort of navigation method on the page:

```ruby
page = LoginPage.new(browser)
page.visit
```

Since the site object has the browser, is paying attention to the browser URL *and* knows what the page URL should look like, it's able to take some shortcuts. Here's how the same operation would work using a site object:

```ruby
# When a page accessor method is called the site object does the following:
# - Initializes the page.
# - Compares the browser URL against the page's URL template.
#  - If the URL template DOESN'T match the current URL then it automatically
#    navigates to the page.
#  - If the URL template DOES match the current URL then it doesn't navigate
#    (since the page is already being displayed.)
site.login_page
```

*Note:* There's also an additional helper method that gets created for each page object, which allows you to check whether or not it's being displayed in the browser:

```ruby
site.login_page? # Additional helper method created for each page class.
=> true
```

### Templated URLs and Support for Object Arguments
All URLs for page objects are defined using URL templates and the templates are implemented using the [addressable](https://github.com/sporkmonger/addressable) gem. Typically, a relative URL is defined for the page and this is used with the site's base URL to create a template for the page. The template is used to build the page URL for navigation and (mostly) used to determine if the page is being displayed.

More info about URL templates can be found in the [RFC](https://www.rfc-editor.org/rfc/rfc6570.txt) if you're interested in a little light reading.

One of the benefits of using templates is that it makes it easy to define and build more complicated URLs. For example, if you have an account page that requires an account code you can define a page object that looks like this:

```ruby
class AccountPage < MySite::Page
  # Note: This isn't a typo: Ruby string interpolation isn't being used here.
  # The brackets without a leading pound sign are used to define an embedded variable
  # within the template. This gets replaced later on with whatever "account_code" is
  # when the template is used to build a URL.
  set_url "/accounts/{account_code}"
end
```

And then access the page this way:

```ruby
site.account_page account_code: 'ab1ef'
```

Even better, if you have a Ruby object that responds to "account_code" you can just use that. The page object will try to get the page arguments it needs from the account object when it's initialized:

```ruby
site.account_page account
```

In the example above, the account argument can be anything as long as it responds to an account_code method.

*Note:* Regardless of whether you are using a hash or some other object to initialize a page, if the object doesn't respond to an argument required by the templated URL the page object will fall back to looking at the arguments used to initialize the site object. If it sees a match there it will use that argument to fill in the gaps when attempting to initialize the page. This allows you to specify things like a subdomain or a port number when initializing the site object and use them when defining URL templates for your page objects.

### Overriding a URL Template for Navigation Purposes
For cases where the URL template may not be sufficient to match the final URL that's displayed, you can define a regular expression that overrides the template when the site object is looking at the browser URL to determine whether or not it's on a particular page:

```ruby
class AccountPage < MySite::Page
  # This will be used for all navigation.
  set_url "/accounts/{account_code}"

  # This will be used to determine if the page is being displayed (in place of
  # the URL template.)
  set_url_matcher %r{/accounts/\d+$}
end
```

## No need to declare page object variables
Site objects will cache the current page and delegate unrecognized method calls
down to that page. So it's generally never necessary to do this:

```ruby
page = site.login_page
```

The recommended way of doing it is to just rely on the delegation behavior:

```ruby
# Creates a login page object and caches it (or uses the cached version of the
# page if it's already being displayed.)
site.login_page

# The email method gets delegated down to the cached login page.
site.email.set 'foo@bar.net'
```

## Page Templates
Web applications typically have recurring bits of functionality that you'll see on many pages. For example, most web applications have a logout link that's accessible from every page when you are logged in. Things that you'd rather not define over and over. To handle this, you can create one or more page templates that contain these common features. The templates can't be used themselves (no accessor method will be created for them) but other pages can inherit from them.

Here's how to create and use a page template:

```ruby
# Set up a page object as a template using the set_attributes method:
class SomeTemplate
  # This makes this page class a template.
  set_attributes :page_template

  # Common features here.
end

# Create another page object that inherits from your template:
class SomePage < SomeTemplate
  # Page-specific code here...
end
```

## Page Widgets
You'll typically have common features that will be implemented throughout the UI. Widgets allow you to define those features once and then re-use them everywhere the features occur. Examples of things that could be represented by widgets are cards, pagination controls, calendars etc.

When you define a widget two class-level methods get created, one for the widget and another for a collection of those widgets. Let's say that there are multiple places to search in your app and those search options are all implemented in the same (or a similar way.) Here's what a widget might look like for that UI feature:

```ruby
class SearchWidget < MySite::Widget
  text_field :search_text, id: 'search'
  button :submit, type: 'submit'

  def search(query)
    search_text.set(query)
    submit.click
  end

  def clear
    search_text.set('')
    submit.click
  end
end
```

Here's how the newly defined widget could be used in any page that has the search feature:

```ruby
class SomePage < SomeSite::Page
  set_url '/customers'

  search_widget :search_customers, :div, class "Search"
end

# And then...
site.some_page.search_customers.search 'foo'
```

## Updating pages
Pages support an update_page method. This method takes a hash of values and then updates the elements accordingly. It automatically does some introspection, looking at what type of element it's setting and then doing the right thing with the value that's provided. Here's an example of a page with a credit card form:

```ruby
class BillingInfoPage < SomeSite::Page
  text_field :first_name, id: 'fname'
  text_field :last_name, id: 'lname'
  text_field :street, id: 'streetaddr'
  text_field :city, id: 'city'
  select_list :country, id: 'country'
  select_list :state, class: 'Region'
  text_field  :card_number, id: 'cardnum'
  text_field :zip, id: 'postalcode'
  text_field :cvv, id: 'cvv'
  checkbox   :email_notifications, id: 'notifications'
  button :save_changes_button, value: 'Save Changes'

  def save_changes(hsh = {})
    update_page hsh
    save_changes_button.click
  end
end
```

Here's how the save method (that uses update_page) would be called:

```ruby
s.billing_info_page.save_changes(
  first_name: 'puddin',
  last_name: 'tame',
  street: '221 N. First Street',
  city: 'Oakland',
  state: 'California',
  zip: '94605'
  country: 'United States',
  email_notifications: false
)
```

# Sample code for https://www.ruby-lang.org/en/:
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
