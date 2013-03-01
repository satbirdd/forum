require 'spec_helper'

describe "Comments" do
  describe "GET /comments" do
     let(:the_post) { Post.where(title: 'tt_post_title').first_or_create }
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get post_comments_path(the_post)
      response.status.should be(302)
    end
  end
end
