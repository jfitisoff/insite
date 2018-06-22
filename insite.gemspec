require './lib/insite/version'

Gem::Specification.new do |s|
  s.name        = 'insite'
  s.version     = Insite::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.summary     = %q{Wraps page objects up into a site object, which provides some introspection and navigation capabilities that page objects don't provide. Works with Watir and Selenium.}
  s.description = "Page object library."
  s.authors     = ["John Fitisoff"]
  s.email       = 'jfitisoff@yahoo.com'

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
