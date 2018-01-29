require './lib/insite/version'

desc = <<-eos
Insite is a page object library for Selenium and Watir. The main difference between this library and other page object libraries is the the focus is on the site as a whole rather than individual pages. All page interaction is handled via a site object.

Bundling pages together as site makes it easier to utilize some introspection to
simplify navigation and page interactions.

The library also provides multiple mechanisms for reusing code across pages and a standard mechanism for updating pages (you just provide a hash argument.)

eos

Gem::Specification.new do |s|
  s.name        = 'insite'
  s.version     = Insite::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = %q{Wraps page objects up into a site object, which provides some introspection and navigation capabilities that page objects don't provide. Works with Watir and Selenium.}
  s.description = desc
  s.authors     = ["John Fitisoff"]
  s.email       = 'jfitisoff@yahoo.com'

  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "addressable"
  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "watir", [">=6.0.0"]
  s.add_runtime_dependency "watir-scroll", [">=0.2.0"]

  s.add_development_dependency "coveralls"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

  s.files       = [
    "lib/insite.rb",
    "lib/insite/element_container/element_container.rb",
    "lib/insite/feature/feature.rb",
    "lib/insite/methods/common_methods.rb",
    "lib/insite/methods/dom_methods.rb",
    "lib/insite/page/defined_page.rb",
    "lib/insite/page/undefined_page.rb",
    "lib/insite/widget/widget_methods.rb",
    "lib/insite/widget/widget.rb",
    "lib/insite/constants.rb",
    "lib/insite/errors.rb",
    "lib/insite/insite.rb",
    "lib/insite/version.rb"
  ]
  s.homepage    = 'http://rubygems.org/gems/insite'
  s.license     = 'MIT'
end
