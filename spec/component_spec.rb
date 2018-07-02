require_relative 'support/spec_helper'

require 'insite'
require 'insite/examples/material_angular_io_site.rb'

describe "component" do
  before(:all) { @s = new_angular_material_session }
  after(:all)  { @s.close }
  let(:s)      { @s }

  it "returns false when #collection? is called" do
    expect(s.mat_chip.collection?).to eq false
  end

  it "returns an array of strings when #classes is called" do
    expect(s.mat_chip.classes.length).to be > 0
  end

  context "component name" do
    it "handles case where pluralized name string == original" do
      expect(s.page.respond_to?(:pluralizes)).to eq true
      expect(s.page.respond_to?(:pluralizeses)).to eq true
    end
  end
end
