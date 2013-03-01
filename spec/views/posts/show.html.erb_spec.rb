require 'spec_helper'

describe "posts/show" do
  before(:each) do
    section = Section.where(name: 'tt_section_name').first_or_create
    @post = assign(:post, section.posts.where(title: 'tt_post_title').first_or_create)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
