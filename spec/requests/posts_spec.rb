require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    let(:section) { Section.where(name: 'tt_section_name').first_or_create }
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get section_posts_path(section)
      response.status.should be(302)
    end
  end
end
