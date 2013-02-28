require "spec_helper"

describe PostsController do
  describe "routing" do
    let(:section) { Section.where(name: 'tt_section_name').first_or_create}

    it "routes to #index" do
      get("/sections/#{ section.id }/posts").should route_to( controller: 'posts', action: 'index', section_id: section.id.to_s)
    end

    it "routes to #new" do
      get("/sections/#{ section.id }/posts/new").should route_to(controller: 'posts', action: 'new', section_id: section.id.to_s)
    end

    it "routes to #show" do
      get("/posts/1").should route_to("posts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/posts/1/edit").should route_to("posts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sections/#{ section.id }/posts").should route_to(controller: 'posts', action: 'create', section_id: section.id.to_s)
    end

    it "routes to #update" do
      put("/posts/1").should route_to("posts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/posts/1").should route_to("posts#destroy", :id => "1")
    end

  end
end
