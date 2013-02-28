require 'spec_helper'

describe "comments/new" do
  before(:each) do
    @post = assign(:post, Post.where(title: 'tt_post_title').first_or_create)
    @comment = assign(:comment, @post.comments.build)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_comments_path(@post), "post" do
    end
  end
end
