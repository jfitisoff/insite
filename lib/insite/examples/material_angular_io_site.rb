# Require support files.
%w(watir_mods site pages utils).each do |f|
  require "insite/examples/material_angular_io/#{f}"
end

# Require hand-crafted artisanal components.
%w(mat_chip_list mat_chip mat_form_field mat_input mat_option
   mat_select_content mat_select).each do |c|
  require "insite/examples/material_angular_io/components/#{c}"
end

# Most of the pages for material.angular.io are auto-generated because
# their URLs match a pattern. But some custom page definitions are included
# below. This first overwrites the auto-generated page definition for
# the /chips/overview page, adding some additional stuff that is used
# in some of the automated tests.
class ChipsOverviewPage < MaterialAngularIO::Page
  set_url "/components/chips/overview"

  elements :examples, tag_name: 'example-viewer'
  divs :divs, class: /^mat-/

  element :chip, tag_name: 'mat-chip'

  mat_chip_list :basic_chips, index: 0
  mat_chip_list :chips_with_input, index: 1
  mat_chip_list :chips_autocomplete, index: 2
end
