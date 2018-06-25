# insite
[![Gem Version](https://badge.fury.io/rb/insite.svg)](https://rubygems.org/gems/insite)
[![Build Status](https://circleci.com/gh/jfitisoff/insite.svg?style=shield)](https://circleci.com/gh/jfitisoff/insite)
[![Coverage Status](https://coveralls.io/repos/jfitisoff/insite/badge.svg?nocache)](https://coveralls.io/r/jfitisoff/insite)

Insite is a page object library that is geared towards supporting component-based web frameworks such as Angular, React, etc., allowing you to write test framework components that model recurring features in the application under test. This allows you to write code _once_ for application features like cards, search widgets, pagination, etc. and then easily re-use this code everywhere that the feature occurs.

This library also has some useful navigational and organizational features that stem from the way that pages are used. The page objects that you define with this library are utilized via a _site object_. This site object can be thought of as a _browser_ for your page objects. As you navigate through a site, the site object keeps track of where you are and delegates method calls down to the currently displayed page.

All HTML objects are modeled as Elements (e.g., Selenium or Watir elements) _or_ as Components. Elements and Components are interchangable, meaning that they are designed to interact with each other.

**Note:** Documentation for this library is still a WIP and features are subject to change.

# Installation:
```
 gem install insite
```

**Note:** You'll need to install a browser driver.
[ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver) is recommended since Selenium tries to load that one by default if you don't specify the driver.

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

## Using the new site object
```ruby
# Create a new instance of the site object.
s = MySite.new "https://mysite.com"

# Open a browser.
s.open

# Log into the site. Note that there's no explicit navigation. If the login page
# isn't displayed, navigation is _automatic_ If the page _is_ being displayed
# then navigation doesn't occur since you're already there.
s.login_page.login(email: "foo@bar.com", "P@ssword123")
```

# Elements and Components
Elements are standard DOM objects e.g., div, span, etc. Components are reusable widgets for recurring features in your application (cards, pagination, toggle widget etc.) These features can be identified by class, tag name, xpath, css etc.

Element methods are automatically defined. Component methods automatically get defined when you create a Component class for your site as defined below.

### Elements and Components are Interchangeable
Elements and Components can interact with each other:
```ruby
s.element1.component1

s.component1.element1
```

## Elements
Elements are any standard DOM object (div, span etc.) Insite provides page object class methods for defining element accessors for these -- see the page object example above, which defines element accessors for two text fields and a button.

Element methods are predefined for page objects. When defining a page object class there should be element methods that correspond to all of the standard HTML tags.

### Simple element examples

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

### Element with block argument

```ruby
# More complex div element containing sub-elements.
div :allow_purchase_code, class: "multi-currency", do
  button :enable, id: "pc-enable"
  radio  :initial_purchase, id: "pc-initial-only"
  radio  :all_purchases, id: "pc-all"
  button :submit, id: "pc-confirm"
end
```

## Components
Components are pseudo-elements that are designed to model recurring UI features.

### Creating Components

To define a Component you just need to create a class that inherits from the site object's Component class:

```ruby
# Note: When you define a class for an individual Component a collection class
# for the Component is automatically created.
class SomeComponent < MySite::Component
end
```

When defining the component, you'll usually want to defined how to _identify_ it. This is done using the select_by method. This method is used to specify a base set of attributes (a "selector") that will be used to identify the Component:

```ruby
class SomeComponent < MySite::Component
  select_by tag_name: "foo", class: "bar"
end
```

The selector attributes are locked. You can't overwrite them but you _can_ add to them:
```ruby
class ComponentExamplePage < MySite::Page
  set_url "/foo"

  # Text isn't defined in the base selector so it gets added and the accessor
  # method for this component will find the element using the following:
  # tag_name: "foo", class: "bar", text: "Foo Bar Baz"
  some_component :foo_bar_baz, text: "Foo Bar Baz"
end
```

When defining a Component that inherits from another Component, you can use the select_by! method to overwrite the selector defined for the superclass:

```ruby
class SomeComponent < MySite::Component
  select_by tag_name: "foo"
end

class SomeOtherComponent < SomeComponent
  # Overwrites the selector defined for the superclass.
  select_by! tag_name: "bar"
end
```

It's not actually necessary to define a Component selector. However, If you don't specify a selector you'll be required to specify arguments to identify the component:

```ruby
class ExampleComponent < MySite::Component
end
```

### Creating a Component
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
