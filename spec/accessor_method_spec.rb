require_relative 'support/spec_helper'

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

    it "returns modified element when block is given" do
      expect(s.modified_chip_element.test_method).to eq "One fish"
    end

    it "returns collection for an element collection accessor" do
      expect(s.examples_collection.length).to eq 3
      expect(s.examples_collection.last.text).to match /^Chips Autocomplete/
    end

    it "returns modified element collection when block is given" do
      expect(s.modified_examples_collection.test_method).to eq "output"
    end
  end

  context "components" do
    it "returns component for an component accessor" do
      expect(s.mat_chip.text).to eq "One fish"
      expect(s.mat_chip).to_not respond_to :test_method
    end

    it "returns modified component when block is given" do
      expect(s.modified_chip.test_method).to eq "One fish"
    end

    it "returns collection for an component collection accessor" do
      expect(s.mat_examples_collection.length).to eq 3
      expect(s.mat_examples_collection.last.text).to match /^Chips Autocomplete/
    end

    it "returns modified component collection when block is given" do
      expect(s.modified_mat_examples_collection.test_method).to eq "output"
    end
  end
end
