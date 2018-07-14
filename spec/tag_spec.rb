require_relative 'support/spec_helper'

require 'insite'
require 'insite/examples/material_angular_io_site.rb'

describe "site tag methods" do
  before(:all) { @s = new_angular_material_session }
  after(:all)  { @s.close }
  let(:s)      { @s }

  it "returns an array of non-standard tags when #find_non_standard_tags is called" do
    expect(s.find_non_standard_tags).to be_instance_of Array
    expect(s.find_non_standard_tags.length).to be > 0
  end

  it "returns an array of standard tags when #html_tags is called" do
    expect(s.html_tags).to be_instance_of Array
    expect(s.html_tags).to include :divs
  end

  it "returns an xpath string when #non_standard_tag_xpath is called" do
    expect(s.non_standard_tag_xpath).to be_instance_of String
  end
end
