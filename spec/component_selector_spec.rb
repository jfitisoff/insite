require_relative 'support/spec_helper'

require 'insite'
require 'insite/examples/material_angular_io_site.rb'

describe "component selectors" do
  before(:all) { @s = new_angular_material_session }
  after(:all)  { @s.close }
  let(:s)      { @s }

  context "selector not defined for class" do

    context "page element accessor methods" do
      it "raises when accessor definition doesn't include selector" do
        expect { s.test_no_selector }.to raise_error(
          Insite::Errors::ComponentSelectorError
        )
      end

      it "returns element when selector is specified" do
        selector = s.test_no_selector_with_args.selector
        expect(selector).to eq({tag_name: :div, index: 3})
      end
    end

    context "component methods" do
      it "raises when accessor definition doesn't include selector" do
        expect { s.no_selector }.to raise_error(
          Insite::Errors::ComponentSelectorError
        )
      end

      it "returns element when selector is specified" do
        selector = s.no_selector(tag_name: :span, index: 2).selector
        expect(selector).to eq({tag_name: :span, index: 2})
      end
    end
  end

end
