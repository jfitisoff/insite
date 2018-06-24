require './lib/insite/version'

Gem::Specification.new do |s|
  s.name        = 'insite'
  s.version     = Insite::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  doc = "Insite is a page object library that's geared towards writing reusable " \
   "code for component-based web applications. It allows you to write reusable " \
   "test components that model your application components. These components are " \
   "interchangable with regular DOM objects. Insite uses a \"Site Object Model.\" " \
   "You create a site object class and define pages and components for the site. " \
   "You then use the site object as the interface to your application instead of " \
   "declaring individual pages each time that the site context changes. Think of " \
   "the site object as a browser for page objects."
  s.summary     = doc
  s.description = doc
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
