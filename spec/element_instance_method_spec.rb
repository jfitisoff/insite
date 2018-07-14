require_relative 'support/spec_helper'

require 'insite'
require 'insite/examples/material_angular_io_site.rb'

describe "element instance methods" do
  before(:all) { @s = new_angular_material_session }
  after(:all)  { @s.close }
  let(:s)      { @s }
  let(:elem)   { @s.mat_chip_list.elements.first }

  Insite::METHOD_MAP.each do |k, v|
    v.each do |mth|
      it "responds to \##{mth}" do
        tmp = elem.send(mth)
        expect(tmp).to be_truthy
        expect(tmp).to respond_to :collection?
      end
    end
  end
end
