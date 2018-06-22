require_relative 'angular_material_component'

class MatInput < MaterialAngularIO::Component
  select_by tag_name: 'input', class: 'mat-input-element'
end
