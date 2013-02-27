require 'spec_helper'

describe CommentsController do

  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # update the return value of this method accordingly.
  let(:section) { Section.where(name: 'sectin_for_test').first_or_create }
  let(:the_post) { section.posts.where(title: 'post_for_test').first_or_create }

  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all comments as @comments" do
      comment = the_post.comments.create valid_attributes
      get :index, { section_id: section.id, post_id: the_post.id }, valid_session
      assigns(:comments).should eq([comment])
    end
  end

  describe "GET show" do
    it "assigns the requested comment as @comment" do
      comment = the_post.comments.create valid_attributes
      get :show, {:id => comment.to_param, section_id: section.id, post_id: the_post.id }, valid_session
      assigns(:comment).should eq(comment)
    end
  end

  describe "GET new" do
    it "assigns a new comment as @comment" do
      get :new, {section_id: section.id, post_id: the_post.id}, valid_session
      assigns(:comment).should be_a_new(Comment)
    end
  end

  describe "GET edit" do
    it "assigns the requested comment as @comment" do
      comment = the_post.comments.create valid_attributes
      get :edit, {:id => comment.to_param, section_id: section.id, post_id: the_post.id}, valid_session
      assigns(:comment,).should eq(comment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, {:comment => valid_attributes, section_id: section.id, post_id: the_post.id}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {:comment => valid_attributes, section_id: section.id, post_id: the_post.id}, valid_session
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the created comment" do
        post :create, {:comment => valid_attributes, section_id: section.id, post_id: the_post.id}, valid_session
        comment = Comment.last
        response.should redirect_to([section, the_post, comment])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:comment => {  }, section_id: section.id, post_id: the_post.id}, valid_session
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:comment => {  }, section_id: section.id, post_id: the_post.id}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = the_post.comments.create valid_attributes
        # Assuming there are no other comments in the database, this
        # specifies that the Comment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Comment.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => comment.to_param, :comment => { "these" => "params" }, section_id: section.id, post_id: the_post.id}, valid_session
      end

      it "assigns the requested comment as @comment" do
        comment = the_post.comments.create valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes, section_id: section.id, post_id: the_post.id}, valid_session
        assigns(:comment).should eq(comment)
      end

      it "redirects to the comment" do
        comment = the_post.comments.create valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes, section_id: section.id, post_id: the_post.id}, valid_session
        response.should redirect_to([section, the_post, comment])
      end
    end

    describe "with invalid params" do
      it "assigns the comment as @comment" do
        comment = the_post.comments.create valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :comment => {  }, section_id: section.id, post_id: the_post.id}, valid_session
        assigns(:comment).should eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = the_post.comments.create valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :comment => {  }, section_id: section.id, post_id: the_post.id}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = the_post.comments.create valid_attributes
      expect {
        delete :destroy, {:id => comment.to_param, section_id: section.id, post_id: the_post.id}, valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = the_post.comments.create valid_attributes
      delete :destroy, {:id => comment.to_param, section_id: section.id, post_id: the_post.id}, valid_session
      response.should redirect_to(section_post_comments_url(section, the_post))
    end
  end

end
