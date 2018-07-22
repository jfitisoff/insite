# insite
[![Gem Version](https://badge.fury.io/rb/insite.svg)](https://rubygems.org/gems/insite)
[![Build Status](https://circleci.com/gh/jfitisoff/insite.svg?style=shield)](https://circleci.com/gh/jfitisoff/insite)
[![Coverage Status](https://img.shields.io/coveralls/github/jfitisoff/insite/master.svg)](https://img.shields.io/coveralls/github/jfitisoff/insite/master.svg)

Insite is a page object library that is geared towards supporting component-based web frameworks such as Angular, React, etc. It allows you to create test framework components that model recurring features in the application under test. This allows you to write code _once_ for application features like cards, search widgets, pagination, etc. and then easily re-use this code _everywhere_ that the feature occurs.

This library also has some useful navigational and organizational features that stem from the way that pages are used. The page objects that you define with this library are utilized via a _site object_. This site object can be thought of as a _browser_ for your page objects. As you navigate through a site, the site object keeps track of where you are and delegates method calls down to the currently displayed page.

All HTML objects are modeled as Elements (e.g., Selenium or Watir elements) _or_ as Components. Elements and Components are interchangable, meaning that they are designed to interact with each other.

**Note:** Documentation for this library is still a WIP and features are subject to change.

# Sample Code
Some sample code for material.angular.io can be found [here](https://github.com/jfitisoff/insite/tree/master/lib/insite/examples/material_angular_io).

**Note:** This is not an Angular-specific library.

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

## Creating a Site Object
```ruby
# Create a new instance of the site object.
s = MySite.new "https://mysite.com"

# Open a browser. You can pass browser arguments in if necessary and they'll get
# just passed through to the constructor (See Watir/Selenium docs describing
# args allowed when creating new browser/driver instances.)
s.open

# Log into the site. Note that there's no explicit navigation. If the login page
# isn't displayed, navigation is _automatic_ If the page _is_ being displayed
# then navigation doesn't occur since you're already there.
s.login_page.login(email: "foo@bar.com", password: "P@ssword123")
```

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

Your web application pages likely have common features that are implemented in the same or in a similar way everywhere they show up in your application. Components allow you to write portable implementations of those features that you can apply everywhere that the feature occurs. Benefits:

 * Page implementations become more standardized. If you use the same component everywhere that the feature occurs then the way that you interface with the feature is uniform throughout the application.
 * Easier maintenance. When you use components, the implementation is in one place and you don't have to make changes in multiple places. You can also make changes to your framework code much more quickly.

Components are customizable wrappers around DOM elements. The process of identifying components is a little more complicated than identifying DOM elements. Each DOM element has a unique tag. Components are a little more abstract. They're designed to model features that your developers are writing and there may be (hopefully minor) variations in how that feature is implemented in the UI. For example, sometimes a UI card might be implemented in a div and sometimes in a section.

Components allow you specify a sort of base selector in the component definition. This base selector is intended to identify the component in the same way that a standard DOM element is identified.

Ideally, you want to find one thing (or a reliable combination of things) that you can use to uniquely identify components on a page. In some cases you can do that by class, or maybe the component uses a non-standard HTML tag. But you can have more complicated cases. For example, maybe you are trying to model cards in your application and the cards are sometimes implemented in a div and sometimes in a section. It may take a little work to figure this out but it's well worth it. Here's an example of a component definition for a toggle widget:

```ruby
# Component must inherit from your site's Component class (this class is
# automatically added to your site when you include Insite.)
class UIToggle < MySite::Component
  select_by class: 'Toggle'

  def on
    click unless on?
  end

  # The HTML method returns the component's HTML.
  def on?
    html.match(/-toggle-on/)
  end

  def off
    click unless off?
  end

  def off?
    !off?
  end
end
```

When a component is defined you automatically get support for calling it in a variety of ways. Here's how you would use the toggle in a page object definition:

```ruby
# Accessor methods in page object class definitions:
class FooPage < MySite::Page
  set_url '/foo'

  # Creates a 'site_access' method that returns a UIToggle:
  ui_toggle :site_access_toggle text: "Site Access"

  # Creates an 'all_special_toggles' method that returns a Toggle collection:
  ui_toggles :all_special_toggles, class: 'special-toggle'
end

# Usage:
s.my_toggle_page # OR page = s.my_toggle_page
s.site_access_toggle.on

s.all_special_toggles.first.on?
=> false
```

There are also some instance methods that automatically get added to all of your page object classes for the component. You get "generic" methods for the component on your page instances, one for a single instance of the component, another for a collection. The method names are the snake-case version of the component's class name (or the pluralized version of the name in the case of a collection.)

```ruby
s.my_toggle_page

# Any page instance supports these component methods:

# Get first toggle on page
s.ui_toggle

# Get toggle with specific text:
s.ui_toggle text: "Special Toggle"

# Get a toggle collection:
s.ui_toggles
```

To recap, when you define a component you can create named accessor methods for the component when you are defining page objects. If you don't define accessor methods in your page object definitions you'll still get methods for working with your components.

### Elements and Components are Interchangeable
Elements and Components can interact with each other:
```ruby
s.element1.component1

s.component1.element1
```

## Elements
Elements are any standard DOM object (div, span etc.) Insite provides page object class methods for defining element accessors for these -- see the page object example above, which defines element accessors for two text fields and a button.

Insite uses Watir for browser operations so if you're familiar with that API it should feel pretty much the same. The main difference is that all Watir DOM classes are wrapped in an Insite element class. The main reason for the wrapper classes at the moment are to allow interoperability between components and elements. But the plan is to add additional functionality going forward (geared towards making it easier to write page objects and components.)

When an element is defined for a page, there's just one basic accessor that gets created for the element. That's actually by design. Please note that all pages support an update_page method that takes a hash of element names and values and then applies each value to the specified element. This method figures out whether the element is a text field, check box, file field etc., and then does the appropriate thing with the value when working with the element. See the log in code snippet above for a simple example.

### Element definition examples

``` ruby
# Element accessor for a div element that contains customer info.
# Usage: s.page.customer_info
div :customer_info, class: 'customer-info'

# Element accessor for a collection of spans that contain phone numbers.
# Usage: s.page.phone_numbers
spans :phone_numbers, id /^phone-\d+/

# Element accessor for a text field.
# Usage: s.page.first_name
element :first_name, tag_name: "input", id: "fname"
```

### Element definitions with a block argument

```ruby
# More complex element definition (A div element containing multiple
# sub-elements.)
div :allow_purchase_code, class: "multi-currency", do
  button :enable, id: "pc-enable"
  radio  :initial_purchase, id: "pc-initial-only"
  radio  :all_purchases, id: "pc-all"
  button :submit, id: "pc-confirm"
end
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
