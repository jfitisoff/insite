require_relative 'support/spec_helper'

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

      it "adds a chip" do
        s.mat_chip_lists[1].add 'foo'
        expect(s.mat_chip_lists[1].mat_chips.last.text).to match(/^foo/)
      end

      it "deletes a chip" do
        length = s.mat_chip_lists[1].mat_chips.length
        expect(length).to be > 0
        s.mat_chip_lists[1].mat_chips.last.remove
        expect(s.mat_chip_lists[1].mat_chips.length).to eq length - 1
      end
    end
  end

end
