%w(watir_mods site pages utils).each do |f|
  require "insite/examples/material_angular_io/#{f}"
end

%w(angular_material_component mat_input mat_chip mat_chip_list).each do |c|
  require "insite/examples/material_angular_io/components/#{c}"
end

class FooPage < MaterialAngularIO::Page
  set_url "/components/chips/overview"

  mat_chip_lists :chipies, text: /fish/i
  mat_chip_list :foo, index: 1, text: /Lemon/
  mat_chip      :bar, index: 0, text: /Two fish/
end
