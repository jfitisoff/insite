require_relative 'angular_material_component'

class MatChipList < AngularMaterialComponent
  select_by tag_name: 'mat-chip-list'

  def add(value)
# binding.pry
    mat_input(ngcontent => true).to_subtype.set(value + "\n")
  end

  def clear_input(value)
    mat_input(ngcontent => true).to_subtype.clear
  end

  def remove(value)
    mat_input(ngcontent => true).to_subtype.set(value + "\n")
  end

  def set_input(value)
    mat_input(ngcontent => true).to_subtype.set(value)
  end
end
