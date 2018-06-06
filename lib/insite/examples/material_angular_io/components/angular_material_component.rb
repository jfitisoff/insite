class AngularMaterialComponent < MaterialAngularIO::Component
  attr_reader :ngcontent, :nghost

  def ngcontent
    @ngcontent ||=
    attributes.keys.find { |k| k.match(/^_ngcontent-.*/) }
  end

  def nghost
    @nghost ||=
    attributes.keys.find { |k| k.match(/^_nghost-.*/) }
  end
end
