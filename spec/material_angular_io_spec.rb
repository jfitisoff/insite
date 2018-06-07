require 'insite'
require 'insite/examples/material_angular_io_site.rb'

describe "https://material.angular.io" do
  before(:all) { @s = new_angular_material_session }
  after(:all)  { @s.close }
  let(:s)      { @s }

  describe "chip lists" do
    before(:each) { @s.chips_overview_page.refresh }

    context "'basic chips' example" do
      it "contains 4 chips" do
        expect(s.mat_chip_lists[0].mat_chips.length).to eq 4
      end

      it "does not support chip selection" do
        expect(s.mat_chip_lists[0].attributes['aria-multiselectable']).to eq 'false'
      end

      it "does not support text input" do
        expect(s.mat_chip_lists[0].mat_input.exist?).to eq false
      end
    end

    context "'chips with input' example" do
      it "supports text input" do
        expect(s.mat_chip_lists[1].mat_input.exist?).to eq true
      end

      it "supports text input" do
        expect(s.mat_chip_lists[1].mat_input.exist?).to eq true
      end
    end
  end

end
