require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    # @comment = assign(:comment, stub_model(Comment))
    @post = Post.where(title: 'tt_post_title').first_or_create
    @comment = assign(:comment, @post.comments.where( content: 'tt_comment_content').first_or_create)
  end

  # @post = assigns()  Post.where(name: 'tt_post_name').first_or_create }
  #   let(:comment) { post.comments.where( title: 'tt_comment_title').first_or_create }

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
    end
  end
end
