require 'insite'

describe Insite do
  it "converts a class to a tag" do
    expect(subject.class_to_tag(Insite::Button)).to eq :button
  end

  it "converts a tag to a class" do
    expect(subject.tag_to_class(:button)).to eq Insite::Button
  end
end
