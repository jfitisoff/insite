%w(watir_mods site pages utils).each do |f|
  require "insite/examples/material_angular_io/#{f}"
end


%w(mat_chip_list mat_chip mat_form_field mat_input mat_option
   mat_select_content mat_select).each do |c|
  require "insite/examples/material_angular_io/components/#{c}"
end

class FooPage < MaterialAngularIO::Page
  set_url "/components/chips/overview"

  # mat_chip_lists :chipies, text: /fish/i
  mat_chip_list :foo, index: 1, text: /Lemon/
  mat_chip      :bar, index: 0, text: /Two fish/
end
