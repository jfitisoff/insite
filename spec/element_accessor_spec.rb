require 'insite'
require 'insite/examples/material_angular_io_site.rb'

describe "element and component accessor methods" do
  before(:all) do
    @s = new_angular_material_session
    @s.chips_overview_page
  end
  after(:all)  { @s.close }
  let(:s)      { @s }

  context "elements" do
    it "returns element for an element accessor" do
      expect(s.chip_element.text).to eq "One fish"
      expect(s.chip_element).to_not respond_to :test_method
    end

    it "returns modified element for element accessor with block" do
      expect(s.modified_chip_element.test_method).to eq "One fish"
    end

    it "returns collection for an element collection accessor" do
      expect(s.examples_collection.length).to eq 3
      expect(s.examples_collection.last.text).to match /^Chips Autocomplete/
    end

    it "returns modified collection for collection accessor with block" do
      expect(s.modified_examples_collection.test_method).to eq "output"
    end
  end
end
