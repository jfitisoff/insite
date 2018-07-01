require_relative 'support/spec_helper'

require 'insite'
require 'insite/examples/material_angular_io_site.rb'

describe "custom attributes for elements and components" do
  before(:all) { @s = new_angular_material_session }
  after(:all)  { @s.close }
  let(:s)      { @s }

  context ":non_relative attribute" do

    context "component" do
      subject { s.mat_chip_lists[1] }

      it "is a non-relative component when :non_relative attribute is true" do
        expect(subject.mat_chip(non_relative: true).text).to eq "One fish"
      end

      it "is a relative component when :non_relative attribute is false" do
        expect(subject.mat_chip(non_relative: false).text).to eq "Lemon\ncancel"
      end
    end

    context "component_collection" do
      subject { s.mat_chip_lists[1] }

      it "is a non-relative collection when :non_relative attribute is true" do
        expect(subject.mat_chips(non_relative: true).length).to be > 3
      end

      it "is a relative collection when :non_relative attribute is false" do
        expect(subject.mat_chips(non_relative: false).length).to be == 3
      end
    end

    context "element" do
      subject { s.mat_chip_lists[1] }

      it "is a non-relative element when :non_relative attribute is true" do
        expect(
          subject.element(tag_name: 'mat-chip', non_relative: true).text
        ).to eq "One fish"
      end

      it "is a relative element when :non_relative attribute is false" do
        expect(
          subject.element(tag_name: 'mat-chip', non_relative: false).text
        ).to eq "Lemon\ncancel"
      end
    end

    context "element_collection" do
      subject { s.mat_chip_lists[1] }

      it "is a non-relative collection when :non_relative attribute is true" do
        expect(
          subject.elements(tag_name: 'mat-chip', non_relative: true).length
        ).to be > 3
      end

      it "is a relative collection when :non_relative attribute is false" do
        expect(
          subject.elements(tag_name: 'mat-chip', non_relative: false).length
        ).to be == 3
      end
    end
  end
end
