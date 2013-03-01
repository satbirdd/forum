require 'spec_helper'

describe "comments/show" do
  before(:each) do
     the_post = Post.where(title: 'tt_post_title').first_or_create
    @comment = assign(:comment, the_post.comments.where(content: 'tt_comment_content').first_or_create)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
