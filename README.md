# insite
[![Gem Version](https://badge.fury.io/rb/insite.svg)](https://rubygems.org/gems/insite)
[![Build Status](https://circleci.com/gh/jfitisoff/insite.svg?style=shield)](https://circleci.com/gh/jfitisoff/insite)
[![Coverage Status](https://coveralls.io/repos/github/jfitisoff/insite/badge.svg?branch=master)](https://coveralls.io/github/jfitisoff/insite?branch=master)

Insite is a page object library that allows you to work with your website in much the same way as an actual user does. It provides a page object browser (called a _site_ _object_) for your page objects. Site objects are smart: They can determine which page they on and whether or not a page object has been defined for the currently displayed page. Benefits are simplified navigation, better error handling when things go wrong and less code needed to maintain your site and write tests.

<details><summary>Site Object Example</summary>
<p>

```ruby
require 'insite'

# Site object class for your site. It doesn't need to be any
# more complicated than this:
class Wikipedia
  include Insite
end

# Class for Wikipedia portal's "Main Page"
class MainPage < Wikipedia::Page
  set_url "/wiki/Main_Page"

  # Accessor method for "Site Notice" div.
  div :site_notice, id: 'siteNotice'
end

# Class for Wikipedia portal's "Content Page"
class PortalContentsPage < Wikipedia::Page
  set_url "/wiki/Portal:Contents"
end

# Usage

# First create a site object instance, defining a "base URL" for
# the site.
site = Wikipedia.new("https://en.wikipedia.org")

# Open a browser for the site (default is Chrome and assumes you
# have Chromedriver installed.)
site.open

# Sites know about all of their pages:
site.pages
=> [MainPage, PortalContentsPage]

# Get the page that's currently being displayed. Neither of the
# pages you've defined are being displayed so a special "undefined
# page" is returned.
site.page
=> #<Insite::UndefinedPage:0x00007fe3eb172718
 @browser=#<Watir::Browser:0x..fe5ecb18b91b57fe url="data:," title="">,
 @site=#<Wikipedia:0x70308438226360
 @base_url="https://en.wikipedia.org" @most_recent_page=>,
 @url="data:,">

# Navigate to Wikipedia's "Main Page." Insite checks to see if the page is
# displayed and only navigates if it needs to:
site.main_page
=> #<MainPage:70308428311260 @url_template=#<Addressable::Template:0x3ff1f54161a4 PATTERN:https://en.wikipedia.org/wiki/Main_Page>>

# The site tracks the current page and delegates method calls down to
# it. So there's typically no need to declare page object variables. In
# this case, the currently displayed page supports a site_notice method
# method and the site delegates the method call down to the page.
site.site_notice
=> #<Insite::Div: located: true; @selector={:id=>"siteNotice", :tag_name=>:div}>

# Checking which page you are on.
site.main_page?
=> true
site.portal_contents_page
=> false
```

</p>
</details>

Insite also provides a highly flexible, object-oriented approach to writing code for reusable features. It supports this via _components_, which can be thought of as DOM extensions. Components are fully interoperable with standard DOM elements and other components. When a component is defined, you get accessor methods for each page that belongs to your site, one for an individual instance of the component and another for a component collection. You can also define named component accessor in your page object definitions if needed.

<details><summary>Component Example</summary>
<p>
Simple div table example. The methods described below are generic accessors that are automatically created for you. You can also define page-specific component methods in a page class definition. Note that there's no code to wire the components up to each other. Once you've defined a component the its methods available in any context when chaining method calls.

```ruby
# Component for table container
class UITable < MySite::Component
  # Any div where class attribute includes "UITable"
  select_by tag_name: 'div', class: 'UITable'
end

# Component for table row
class UITableRow < MySite::Component
  # Any div where class attribute includes "UITableRow"
  select_by tag_name: 'div', class: 'UITableRow'
end

# Component for table cell
class UITableCell < MySite::Component
  # Any div where class attribute includes "UITableCell"
  select_by tag_name: 'div', class: 'UITableCell'
end

# Usage:

# First UI table on any page:
page.ui_table

# UI table with id == "foo":
page.ui_table(id: "foo")

# UI table collection for a page:
page.ui_tables.length
=> 3

# Components interoperate with each other:
page.ui_table.ui_rows.length
=> 4

# They also interoperate with DOM objects. This gets the first link in the first
# row of the the first table:
page.ui_table.ui_rows[0].link
=> 6

```

</p>
</details>


### Components: Insite's mechanism for reusing code

Insite's components are _DOM_ _extensions_.

The main difference in insite's approach is that

implemented in a similar way

all of the cards will be implemented in a similar way.

Many UI automation libraries have one or more mechanisms for




It allows you to create _highly portable_ test framework components that model recurring features in the application under test. This allows you to write code _once_ for application features like cards, search widgets, pagination, etc. and then easily re-use this code _everywhere_ that the feature occurs.

This library also has some useful navigational and organizational features that stem from the way that your pages are used. The page objects that you define with this library are utilized via a _site object_. This site object can be thought of as a _browser_ for your page objects. As you navigate through a site, the site object keeps track of where you are and delegates method calls down to the currently displayed page. The benefits of this site wrapper approach are outlined [here](https://github.com/jfitisoff/insite/wiki/Benefits-of-a-%22Site-Object-Model%22-approach).

Insite leverages [watir's](https://github.com/watir/watir) API to support standard DOM elements. Insite DOM elements are wrapper classes around watir DOM elements. The wrappers support compatibility between standard HTML DOM elements and the components that you define, as well as functioning as containers for additional functionality.

**Note:** Documentation for this library is still a WIP and features are subject to change.

# How it works

Here's an example that shows how to open a site, navigate to a page and then interact with its contents. If you read further down you'll see examples showing the code that implements this example.

The components being demonstrated here are Angular-specific but insite is framework-agnostic.

If you're interested, here's the [actual page](https://material.angular.io/components/chips/overview) that the example is exercising.

```ruby
# Create a new instance of your site class. The only required argument is the
# "base URL" for the site. You can also pass in optional hash arguments. See
# documententation for more info.
s = MaterialAngularIO.new("https://material.angular.io")

# Open a browser. Optional arguments can be passed in to specify browser type,
# profile, etc.
s.open

# Accessor methods are automatically defined for your pages. If you call an
# accessor method navigation is **automatic**. If you **aren't** on the page
# insite will navigate for you. If you **are** on the page insite will figure
# that out and skip navigation (because you're already there.)
s.chips_overview_page

# Note that no page object variable got declared here. insite caches the
# current page and the site delegates method calls down to the page object.
# So it's not necessary to declare a new page variable every time you access a
# new page. But you can if you want to:
page = s.chips_overview_page

# This next line calls a first_chip_example method that has been manually
# defined in the ChipsOverviewPage page class. Note the subsequent call to
# mat_chips, which returns a chip collection (the second of the two
# components defined above.):
s.first_chip_example.mat_chips.length
=> 4

# Some notes about what's going on here:
#
# 1.) Components are interoperable with standard DOM objects and each other.
#     In the example above, "first_chip_example" and "mat_chips" are both
#     methods that return a component. Chip lists contain chips so these
#     two components are designed to be used together: One doesn't make sense
#     without the other. Because insite treats the components you write as
#     extended DOM objects there's no need to write any glue code to tie these
#     components together -- that happens automatically.
#
# 2.) As mentioned above, that "first_chip_example" method was manually defined
#     for a single page. But when you define a component there are some generic
#     methods that are set up for you automatically. These are page instance
#     methods that you can use when working with a page. In the example above,
#     the mat_chips method was automatically added when the component was
#     defined. For each component you define, there will be a DOM accessor
#     method for a single instance of the component as well as a method to
#     get a component collection.
#
#     Putting this another way: If you define a FooBar component you'll
#     always be able to call "page.foo_bar" and "page.foo_bars" on any
#     given page.
```

Insite has some regression tests that use [material.angular.io](https://material.angular.io). The site code that the tests utilize can be found [here](https://github.com/jfitisoff/insite/tree/master/lib/insite/examples/material_angular_io).

# Installation:
```
 gem install insite
```

**Note:** You'll need to install a browser driver.
[ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver) is recommended since Selenium tries to load that one by default if you don't specify the driver.

# Basic Usage

## Defining a site object
To create a site, you just need to require the gem and then create a site class that includes the Insite module.
```ruby
require 'insite'

class MySite
  include Insite
end
```

If your web application uses custom HTML tags, you can add support for these tags in the site's class definition using the set_custom_tags method, which takes an array of custom tag names and creates components for each tag name:
```ruby
class MySite
  include Insite

  # When the site is initialized, a Component will be created for
  # each of these tags. The Component uses the specified tag as
  # the default attribute for selection.
  set_custom_tags "custom-tag1", "custom-tag2"
end
```

**Note:** Components that are defined in this manner won't have any special functionality. You'll just get named methods that can be used to define and access HTML elements that use the custom tag. See below for information on how components work and how to build more complicated components with custom functionality.

## Creating page objects for your site
Once you've created your site object (by including Insite) you just need to have your page object classes inherit from your site's page class, which gets created when the module is included. Below is a page object for the example shown above. An accessor method for your page is automatically defined on the site object for each page that you create.

```ruby
# A site's pages should inherit from the site's Page class.
class LoginPage < MySite::Page
  # The set_url method is used to define a relative url.
  set_url "/login"

  text_field :email,     id: "email"
  text_field :password,  id: "pwd"
  button :log_in_button, type: "submit"

  # The update_page method used below is a page object method that's supported.
  # by this library. It takes a hash argument of element names and
  # values and then updates the page accordingly (it figures out what the
  # element is and how to apply the value.)
  def log_in(hsh = {})
    update_page hsh
    log_in_button.click
  end
end
```

Here's a page object definition that defines an accessor method for the first chip list on the page:

```ruby
# See https://material.angular.io/components/chips/overview
class ChipsOverviewPage < MaterialAngularIO::Page
  set_url "/components/chips/overview"

  # Defines a named accessor method for the first chip list on the page.
  mat_chip :first_chip_example, index: 0
end
```

Here's how you would use these components on the page when working with your site:

```ruby
s = MaterialAngularIO.new("https://material.angular.io")

s.open

s.chips_overview_page

s.first_chip_example.mat_chips.length
=> 4

s.first_chip_example.mat_chips.first.text
=> "One fish"

s.first_chip_example.mat_chips.first.removable?
=> false
```

In the example above, a named accessor method was created for a chip list on one particular page. Sometimes it's useful to label things. But insite also automatically defines "generic" component accessor methods that you can use on any page. So as long as the component is defined you could use the components described above on any page without writing any additional code:

```ruby
# Return an object for the second chip list on the page.
s.mat_chip_list(index: 2)

# Return a collection of chip lists.
s.mat_chip_lists

# Return the first chip on the page with text "Apple":
s.mat_chip(text: "Apple")

# Return a collection representing all chips on the page:
s.mat_chips
```



## Elements and Components

### Elements
Elements are _standard_ DOM objects e.g., divs, spans, inputs etc. Components are reusable widgets for recurring features in your application (cards, pagination, toggle widget etc.) Elements can be identified by the ways that you would normally expect (one or more attributes or CSS/XPath.)

When defining your page object classes there are class-level methods that model all of the standard DOM objects as well as methods that model _collections_ of those objects.

```ruby
# Defines a page accessor method for a single div element:
div :single_div_method, text: "Some Label"

# Defines a page accessor method for a collection of div elements:
divs :all_divs_on_page

# Using the methods defined above:
page.single_div_method.text
=> "Some Label"

page.all_divs_on_page.length
=> 11
```

### Components

### Elements and Components are Interchangeable
Elements and Components can interact with each other:
```ruby
s.element1.component1

s.component1.element1
```

## Components
Components are pseudo-elements that you define. They are DOM element wrappers that are designed to model recurring UI features.

### Creating Components

To define a component you just need to create a class that inherits from the site object's Component class:

```ruby
# Note: When you define a class for an individual Component a collection class
# for the Component is automatically created.
class SomeComponent < MySite::Component
end
```

When defining a component, you'll usually want to define how to _identify_ it. This is done using the select_by method. This method is used to specify a base set of attributes (a "selector") that will be used to find the component:

```ruby
class SomeComponent < MySite::Component
  select_by tag_name: "foo", class: "bar"
end
```

The selector attributes are locked by default. You can't overwrite them but you _can_ add to them:
```ruby
class ComponentExamplePage < MySite::Page
  set_url "/foo"

  # Text isn't defined in the base selector so it gets added and the accessor
  # method for this component will find the element using the following:
  # tag_name: "foo", class: "bar", text: "Foo Bar Baz" (case insensitive.)
  some_component :foo_bar_baz, text: /Foo Bar Baz/i
end
```

But you can overwrite the defaults if you use the select_by! method, which will completely overwrite an inherited selector

```ruby
class SomeComponent < MySite::Component
  select_by tag_name: "foo"
end

class SomeOtherComponent < SomeComponent
  # Overwrites the selector defined for the superclass.
  select_by! tag_name: "bar"
end
```

It's not actually necessary to define a component selector. However, If you don't specify one you'll always be required to specify selector arguments when using the component in a page definition or calling the default accessor method that gets created when a component is defined (see above.)

```ruby
class ExampleComponent < MySite::Component
end
```

### Components with Custom Functionality
```ruby
# Components should inherit from the site's Component class.
class MatChip < MaterialAngularIO::Component

  # This method defines how to identify the component. It accepts Hash arguments.
  # In this case the means to identify the component is really straightforward:
  # There's a non-standard tag that's always used for chips and this tag is never
  # used for anything else.  
  select_by tag_name: 'mat-chip'

  def disabled?
    element(class: 'mat-chip-disabled').exist?
  end

  def label
    nokogiri.xpath('//text()')[0]
  end

  def remove
    element(class: 'mat-chip-remove').click
  end

  def removable?
    element(class: 'mat-chip-remove').exist?
  end

  def selected?
    aria_selected == 'true'
  end

  def selectable?
    element(class: 'mat-chip-select').exist?
  end
end
```
### Using a Component
```ruby
# Examples for the MatChip component shown above:

# Returns an object for the first MatChip on the page:
s.mat_chip

# Returns an object for the first MatChip with text == "Raspberry":
s.mat_chip(text: "Raspberry")

# Returns a collection representing all MatChips on the page:
s.mat_chips

s.mat_chips.length
=> 4

s.mat_chips.first.text "Orange"
```

## Using a site object's page
```ruby
# Create a site. Main argument is the "base_url" for the site being accessed (required.)
# The constructor also accepts optional hash args.
site = MySite.new "https://mysite.com"

# Start a browser. Any arguments here, e.g., driver type, get used to initialize the browser.
site.open

# Navigate to login page and log in (more on navigation below.)
site.login_page.log_in email: 'foo@bar.com', password: 'PassW0rd8'
```
