require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:section, Section.where(name: 'tt_section_name').first_or_create )
    assign(:posts, [
      stub_model(Post),
      stub_model(Post)
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
