require 'insite'
require 'insite/examples/material_angular_io_site.rb'

describe "dom objects" do
  before(:all) do
    @s = new_angular_material_session
    @s.chips_overview_page
  end
  after(:all)  { @s.close }
  let(:s)      { @s }

  # context "element" do
  #   subject { @s.mat_chip_lists[1] }
  #
  #   it "responds properly to an element method" do
  #     expect(subject.input).to be_present
  #     expect(subject.input.attributes["_ngcontent-c22"]).to eq ""
  #   end
  #
  #   it "responds properly to an element collection method" do
  #     expect(subject.inputs.length).to eq(1)
  #     expect(subject.inputs.first.attributes["_ngcontent-c22"]).to eq ""
  #   end
  #
  #   it "responds properly to a component method" do
  #     expect(subject.mat_chip).to be_present
  #     expect(subject.mat_chip.text).to eq "Lemon\ncancel"
  #   end
  #
  #   it "responds properly to an component collection method" do
  #     expect(subject.mat_chips.length).to eq(3)
  #     expect(subject.mat_chips[1].text).to eq "Lime\ncancel"
  #   end
  # end

  # context "element collection" do
  # end
  #
  context "component" do
    subject { @s.mat_chip_list }

    it "responds properly to an element method" do
      expect(subject.input).to_not be_present
      expect(subject.element(tag_name: 'mat-chip', text: "One fish")).to be_present
    end

    it "responds properly to an element collection method" do
      expect(subject.inputs.length).to eq(0)
    end

    it "responds properly to a component method" do
      expect(subject.mat_chip).to be_present
      expect(subject.mat_chip.text).to eq "One fish"
    end

    it "responds properly to an component collection method" do
      expect(subject.mat_chips.length).to eq(4)
    end
  end

  context "component collection" do
    subject { @s.mat_chip_lists }

    it "returns the correct number of components" do
      expect(subject.length).to eq(3)
    end

    it "handles array conversion properly" do
      expect(subject[0].input).to_not be_present
      expect(subject[1].input).to be_present
    end

    context "collection member" do
      subject { @s.mat_chip_lists[1] }

      it "responds properly to an element method" do
        expect(subject.input.attributes["_ngcontent-c22"]).to eq ""
      end

      it "responds properly to an element collection method" do
        expect(subject.inputs.length).to eq(1)
        expect(subject.inputs.first.attributes["_ngcontent-c22"]).to eq ""
      end

      it "responds properly to a component method" do
        expect(subject.mat_chip).to be_present
        expect(subject.mat_chip.text).to eq "Lemon\ncancel"
      end

      it "responds properly to an component collection method" do
        expect(subject.mat_chips.length).to eq(3)
        expect(subject.mat_chips[1].text).to eq "Lime\ncancel"
      end
    end
  end

  context "element" do
    subject { Insite::Div.new(s, material_docs_example: 'chips-overview') }

    it "responds properly to an element method" do
      expect(subject.input).to_not be_present
      expect(subject.element(tag_name: 'mat-chip', text: "One fish")).to be_present
    end

    it "responds properly to an element collection method" do
      expect(subject.inputs.length).to eq(0)
      expect(subject.elements(tag_name: 'mat-chip').length).to eq(4)
    end

    it "responds properly to a component method" do
      expect(subject.mat_chip).to be_present
      expect(subject.mat_chip.text).to eq "One fish"
    end

    it "responds properly to an component collection method" do
      expect(subject.mat_chips.length).to eq(4)
    end
  end

  context "element collection" do
    subject { Insite::HTMLElementCollection.new(s, tag_name: 'mat-chip-list') }

    it "returns the correct number of elements" do
      expect(subject.length).to eq(3)
    end

    it "handles array conversion properly" do
      expect(subject[0].input).to_not be_present
      expect(subject[1].input).to be_present
    end

    context "element collection member" do
      subject { Insite::HTMLElementCollection.new(s, tag_name: 'mat-chip-list')[1] }

      it "responds properly to an element method" do
        expect(subject.input.attributes["_ngcontent-c22"]).to eq ""
      end

      it "responds properly to an element collection method" do
        expect(subject.inputs.length).to eq(1)
        expect(subject.inputs.first.attributes["_ngcontent-c22"]).to eq ""
      end

      it "responds properly to a component method" do
        expect(subject.mat_chip).to be_present
        expect(subject.mat_chip.text).to eq "Lemon\ncancel"
      end

      it "responds properly to an component collection method" do
        expect(subject.mat_chips.length).to eq(3)
        expect(subject.mat_chips[1].text).to eq "Lime\ncancel"
      end
    end
  end
end
