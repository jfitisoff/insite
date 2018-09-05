require './lib/insite/version'

Gem::Specification.new do |s|
  description = <<~eos
  Insite is a page object library that allows you to work with your website in much the same way as an actual user does. It provides a page object browser (called a _site_ _object_) for your page objects. Site objects are smart: They can determine which page they on and whether or not a page object has been defined for the currently displayed page. Benefits are simplified navigation, better error handling when things go wrong and less code needed to maintain your site and write tests.

  Insite also provides a highly flexible, object-oriented approach to writing code for reusable features. It supports this via _components_, which can be thought of as DOM extensions. Components are fully interoperable with standard DOM elements and other components. When a component is defined, you get accessor methods for each page that belongs to your site, one for an individual instance of the component and another
  eos

  summary = <<~eos
  Insite is a page object library that allows you to work with your website in much the same way as an actual user does.

  This library also provides a highly portable, object oriented approach to modeling recurring features in your application (e,g, cards, calendars. search widgets.) Reusable components that you write for UI testing are fully compatible with standard DOM elements.
  eos

  s.name        = 'insite'
  s.version     = Insite::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.description = description
  s.summary     = summary
  s.authors     = ["John Fitisoff"]
  s.email       = 'jfitisoff@yahoo.com'

  s.required_ruby_version = ">=2.3.0"

  s.add_runtime_dependency "activesupport", [">=4.2.5"]
  s.add_runtime_dependency "addressable", [">=2.5.1"]
  s.add_runtime_dependency "highline", [">=2.0.0"]
  s.add_runtime_dependency "nokogiri", [">=1.7.0"]
  s.add_runtime_dependency "watir", [">=6.11.0"]
  s.add_runtime_dependency "watir-scroll", [">=0.2.0"]

  s.add_development_dependency "coveralls", [">=0.8.21"]
  s.add_development_dependency "simplecov", [">=0.16.1"]
  s.add_development_dependency "pry", [">=0.11.3"]
  s.add_development_dependency "rake", [">=12.3.1"]
  s.add_development_dependency "rspec", [">=3.7.0"]

  s.files = [
    "lib/insite.rb",
    "lib/insite/element/element.rb",
    "lib/insite/element/element_collection.rb",
    "lib/insite/element/generated/class_map.rb",
    "lib/insite/element/generated/element_classes.rb",
    "lib/insite/element/generated/element_instance_methods.rb",
    "lib/insite/methods/common_methods.rb",
    "lib/insite/methods/dom_methods.rb",
    "lib/insite/page/defined_page.rb",
    "lib/insite/page/undefined_page.rb",
    "lib/insite/component/component_methods.rb",
    "lib/insite/component/component_instance_methods.rb",
    "lib/insite/component/component.rb",
    "lib/insite/component/component_collection.rb",
    "lib/insite/constants.rb",
    "lib/insite/errors.rb",
    "lib/insite/insite.rb",
    "lib/insite/version.rb",
    "lib/insite/examples/material_angular_io_site.rb"
  ] +
  %w(watir_mods site pages utils).map do |f|
    "lib/insite/examples/material_angular_io/#{f}.rb"
  end +
  Dir["lib/insite/examples/material_angular_io/components/*.rb"]

  s.homepage    = 'https://github.com/jfitisoff/insite'
  s.license     = 'MIT'
end
