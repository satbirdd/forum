require 'spec_helper'

describe "posts/new" do
  before(:each) do
    @section = assign(:secton, Section.where(name: 'tt_section_name').first_or_create)
    assign(:post, @section.posts.build)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", section_posts_path(@section), "post" do
    end
  end
end
