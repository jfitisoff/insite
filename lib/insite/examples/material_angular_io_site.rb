# Require support files.
%w(watir_mods site pages utils).each do |f|
  require "insite/examples/material_angular_io/#{f}"
end

# Require hand-crafted artisanal components.
%w(example_viewer mat_chip_list mat_chip mat_icon mat_form_field
   mat_input mat_option mat_select_content mat_select no_selector
   overwritten_selector pluralized_name_test).each do |c|
  require "insite/examples/material_angular_io/components/#{c}"
end

# Most of the pages for material.angular.io are auto-generated because
# their URLs match a pattern. But some custom page definitions are included
# below. This first overwrites the auto-generated page definition for
# the /chips/overview page, adding some additional stuff that is used
# in some of the automated tests.
class ChipsOverviewPage < MaterialAngularIO::Page
  set_url "/components/chips/overview"

  no_selector :test_no_selector_with_args, tag_name: :div, index: 3

  overwritten_selector :overwritten_selector

  elements :mat_examples_collection, tag_name: 'example-viewer'
  elements :modified_mat_examples_collection, tag_name: 'example-viewer' do
    def test_method
      'output'
    end
  end

  elements :examples_collection, tag_name: 'example-viewer'
  elements :modified_examples_collection, tag_name: 'example-viewer' do
    def test_method
      'output'
    end
  end

  mat_chip :chip, tag_name: 'mat-chip'
  element :modified_chip, tag_name: 'mat-chip' do
    def test_method
      text
    end
  end

  element :chip_element, tag_name: 'mat-chip'
  element :modified_chip_element, tag_name: 'mat-chip' do
    def test_method
      text
    end
  end

  mat_chip_list :basic_chips, index: 0
  mat_chip_list :chips_with_input, index: 1
  mat_chip_list :chips_autocomplete, index: 2
end
