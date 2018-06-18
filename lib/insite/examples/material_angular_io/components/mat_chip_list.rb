require_relative 'angular_material_component'
require 'pry'
class MatChipList < AngularMaterialComponent
  select_by tag_name: 'mat-chip-list'

  def add(value)
    mat_input(ngcontent => true).set(value + "\n")
  end

  def clear_input(value)
    mat_input(ngcontent => true).clear
  end

  def remove(value)
    mat_input(ngcontent => true).set(value + "\n")
  end

  def set_input(value)
    mat_input(ngcontent => true).set(value)
  end
end
