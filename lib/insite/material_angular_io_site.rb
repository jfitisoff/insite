# binding.pry
%w(watir_mods site pages utils).each do |f|
  require "insite/examples/material_angular_io/#{f}"
end

require "insite/examples/material_angular_io/components/angular_material_component"
require "insite/examples/material_angular_io/components/mat_input"
require "insite/examples/material_angular_io/components/mat_chip"
require "insite/examples/material_angular_io/components/mat_chip_list"


# Dir["lib/examples/material_angular_io/components/*.rb"].each do |f|
#   require_relative f
# end

class FooPage < MaterialAngularIO::Page
  set_url "/components/chips/overview"

  # mat_chip_list :foo, index: 1, text: /Lemon/
  # mat_chip      :bar, index: 0, text: /Two fish/
end
