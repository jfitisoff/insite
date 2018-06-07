def new_angular_material_session
  s = MaterialAngularIO.new 'https://material.angular.io'
  s.open
  s
end
