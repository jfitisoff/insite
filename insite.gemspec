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
  s.add_runtime_dependency "nokogiri", [">=1.7.0"]
  s.add_runtime_dependency "watir", [">=6.0.0"]
  s.add_runtime_dependency "watir-scroll", [">=0.2.0"]

  s.add_development_dependency "coveralls"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

  s.files = [
    "lib/insite.rb",
    "lib/insite/element/element.rb",
    "lib/insite/element/element_collection.rb",
    "lib/insite/element/generated/element_classes.rb",
    "lib/insite/element/generated/element_instance_methods.rb",
    "lib/insite/feature/feature.rb",
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
    "lib/insite/examples/angular_material_site.rb",
    "lib/insite/examples/angular_material_site/site.rb",
    "lib/insite/examples/angular_material_site/pages.rb",
    "lib/insite/examples/angular_material_site/utils.rb",
    "lib/insite/examples/angular_material_site/components/mat_badge.rb",
    "lib/insite/examples/angular_material_site/components/mat_button_toggle_group.rb",
    "lib/insite/examples/angular_material_site/components/mat_button_toggle.rb",
    "lib/insite/examples/angular_material_site/components/mat_button.rb",
    "lib/insite/examples/angular_material_site/components/mat_checkbox.rb",
    "lib/insite/examples/angular_material_site/components/mat_chip_list.rb",
    "lib/insite/examples/angular_material_site/components/mat_chip.rb",
    "lib/insite/examples/angular_material_site/components/mat_error.rb",
    "lib/insite/examples/angular_material_site/components/mat_form_field_select.rb",
    "lib/insite/examples/angular_material_site/components/mat_form_field_input.rb",
    "lib/insite/examples/angular_material_site/components/mat_form_field_select.rb",
    "lib/insite/examples/angular_material_site/components/mat_form_field.rb",
    "lib/insite/examples/angular_material_site/components/mat_input.rb",
    "lib/insite/examples/angular_material_site/components/mat_option.rb",
    "lib/insite/examples/angular_material_site/components/mat_pseudo_checkbox.rb",
    "lib/insite/examples/angular_material_site/components/mat_radio_button.rb",
    "lib/insite/examples/angular_material_site/components/mat_radio_group.rb",
    "lib/insite/examples/angular_material_site/components/mat_select_content.rb",
    "lib/insite/examples/angular_material_site/components/mat_select.rb",
    "lib/insite/examples/angular_material_site/components/mat_textarea.rb",
  ]

  s.homepage    = 'https://github.com/jfitisoff/insite'
  s.license     = 'MIT'
end
