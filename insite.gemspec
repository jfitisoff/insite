require './lib/insite/version'

desc = <<-eos
Insite is a page object library for Selenium and Watir. The main difference between
this library and other page object libraries is the the focus is on the site as a
whole rather than individual pages. All page interaction is handled via a site
object:

#{' '*14}site_object
#{' '*19}\u2503
    \u250F#{"\u2501"*14}\u254b#{"\u2501"*14}\u2513
login_page   account_page    status_page

Why would you want to do that? Because bundling pages together as site makes it easier to
utilize some introspection to simplify how you interact with pages. A lot of page object
libraries work something like this:

  page = LoginPage.new(browser)
  page.visit
  page.login 'email@testcom', 'Password'

The same operation would look like this when using Insite:

  site.login_page.login 'email@testcom', 'Password'

Note that there's no call to load the page. Insite has all of the page object definitions
and figures out which page you are on. If you're NOT on the right page the navigation
gets handled automatically. And if you're already on that page then Insite won't
bother trying to navigate and just perform the method call.

Insite pays close attention to which page is currently being displayed and delegates method calls
down to the page that's currently being displayed. Let's say that you're on that login page
mentioned above. Instead of explicitly calling the login method on the login page, you can
just call it on the site like this:

  site.login 'email@testcom', 'Password'

If the current page that the site sees doesn't respond to the method call then the site checks
to ensure that it has the current page and then tries to reapply the method. If that doesn't
work it'll raise an error stating what the method call was, what the current page was. This
makes it easier to work with multi-page workflows and easier to understand when there's a
redirect to an unexpected page.

Other features include multiple mechanisms for reusing code across pages and a standard
mechanism for updating pages (you just provide a hash argument.)

eos

Gem::Specification.new do |s|
  s.name        = 'insite'
  s.version     = Insite::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = %q{Wraps page objects up into a site object, which provides some introspection and navigation capabilities that page objects don't provide. Works with Watir and Selenium.}
  s.description = desc
  s.authors     = ["John Fitisoff"]
  s.email       = 'jfitisoff@yahoo.com'
  s.files       = [
    "lib/insite.rb",
    "lib/insite/element_container/element_container.rb",
    "lib/insite/feature/feature.rb",
    "lib/insite/methods/common_methods.rb",
    "lib/insite/methods/watir_methods.rb",
    "lib/insite/page/page_class_methods.rb",
    "lib/insite/page/page_instance_methods.rb",
    "lib/insite/page/undefined_page.rb",
    "lib/insite/widget/widget_methods.rb",
    "lib/insite/widget/widget.rb",
    "lib/insite/constants.rb",
    "lib/insite/exceptions.rb",
    "lib/insite/insite.rb",
    "lib/insite/version.rb"
  ]
  s.homepage    = 'http://rubygems.org/gems/insite'
  s.license     = 'MIT'
end
