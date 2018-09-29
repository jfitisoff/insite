require './lib/insite/version'

Gem::Specification.new do |s|
  summary = [
    "Insite is a page object library that allows you to work with your website in",
    "a more natural way. It does this by providing a wrapper class for all of your",
    "pages. This wrapper (called a site object) functions as a sort of browser for",
    "your page objects. Benefits of this approach include simplified navigation ",
    "and better error handling when things go wrong.\n",
    "Insite also provides a highly portable, object oriented approach to modeling",
    "recurring features in your web application (e.g., cards, calendars, search ",
    "widgets, etc.) Components that you write are essentially DOM extensions:",
    "They can be referenced from other components or any standard DOM object.",
    "This interoperability with the DOM makes your component features more",
    "accessible when writing tests and almost completely eliminates the need to",
    "write code to wire your components up to pages or to get them to work with",
    "other components."
  ].join("\n")

  s.name        = 'insite'
  s.version     = Insite::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.description = summary
  s.summary     = summary
  s.authors     = ["John Fitisoff"]
  s.email       = 'jfitisoff@yahoo.com'

  s.required_ruby_version = ">=2.3.0"

  s.add_runtime_dependency "activesupport", [">=4.2.5"]
  s.add_runtime_dependency "addressable", [">=2.5.1"]
  s.add_runtime_dependency "highline", [">=2.0.0"]
  s.add_runtime_dependency "nokogiri", [">=1.7.0"]
  s.add_runtime_dependency "watir", [">=6.11.0", "<6.14.0"]
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
