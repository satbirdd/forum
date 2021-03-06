require 'spec_helper'

describe PostsController do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # update the return value of this method accordingly.
  let(:section) { Section.where(name: 'sectin_for_test').first_or_create }
  let(:user) { FactoryGirl.create(:user) }

  def valid_attributes
    { title: 'tt_title', body: 'this is the body of test post' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all posts as @posts" do
      post = section.posts.create valid_attributes
      get :index, { section_id: section.id }#, valid_session
      assigns(:posts).should eq([post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = Post.create! valid_attributes
      get :show, {:id => post.to_param,  section_id: section.id }#, valid_session
      assigns(:post).should eq(post)
    end
  end

  describe "GET new" do
    describe "authenticated" do
      it "assigns a new post as @post while the user had been login" do
        sign_in user
        get :new, {section_id: section.id, locale: "da",  section_id: section.id }#, valid_session
        assigns(:post).should be_a_new(Post)
      end
    end

    describe "unanthenticated" do
      it "redirect_to login page while the user had not been login" do
        sign_out user
        get :new, {section_id: section.id, locale: "da",  section_id: section.id }#, valid_session
        response.should redirect_to new_user_session_path
      end
    end
  end

  describe "GET edit" do
    describe "authenticated" do
      it "assigns the requested post as @post" do
        sign_in user
        post = Post.create! valid_attributes
        get :edit, {:id => post.to_param,  section_id: section.id }#, valid_session
        assigns(:post).should eq(post)
      end
    end

    describe "unanthenticated" do
      it "redirect to the sessions#new page" do
        sign_out user
        post = Post.create! valid_attributes
        get :edit, {id: post.to_param, section_id: section.id}
        response.should redirect_to new_user_session_path
      end
    end
  end

  describe "POST create" do
    describe "with valid params" do
      context "authenticated" do
        before(:each) { sign_in user }
        it "creates a new Post" do
          expect {
            post :create, {:post => valid_attributes,  section_id: section.id }#, valid_session
          }.to change(Post, :count).by(1)
        end

        it "assigns a newly created post as @post" do
          post :create, {:post => valid_attributes,  section_id: section.id }#, valid_session
          assigns(:post).should be_a(Post)
          assigns(:post).should be_persisted
        end

        it "redirects to the created post" do
          post :create, {:post => valid_attributes,  section_id: section.id }#, valid_session
          post = Post.last
          response.should redirect_to(post)
        end
      end

      context "unauthenticated" do
        it "redirect to session#new" do
          sign_out user
          post :create, {:post => valid_attributes,  section_id: section.id }#, valid_session
          post = Post.last
          response.should redirect_to new_user_session_path
        end
      end
    end

    describe "with invalid params" do
      context "authenticated" do
        before(:each) { sign_in user }
        it "assigns a newly created but unsaved post as @post" do
          # Trigger the behavior that occurs when invalid params are submitted
          Post.any_instance.stub(:save).and_return(false)
          post :create, {:post => {  },  section_id: section.id }#, valid_session
          assigns(:post).should be_a_new(Post)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Post.any_instance.stub(:save).and_return(false)
          post :create, {:post => {  },  section_id: section.id }#, valid_session
          response.should render_template("new")
        end
      end

      context "unauthenticated" do
        it "redirect to session#new" do
          sign_out user
          Post.any_instance.stub(:save).and_return(false)
          post :create, {:post => {  },  section_id: section.id }
          response.should redirect_to new_user_session_path
        end
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      context "authenticated" do
        before(:each) { sign_in user }

        it "updates the requested post" do
          post = Post.create! valid_attributes
          # Assuming there are no other posts in the database, this
          # specifies that the Post created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Post.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
          put :update, {:id => post.to_param, :post => { "these" => "params" } }#, valid_session
        end

        it "assigns the requested post as @post" do
          post = Post.create! valid_attributes
          put :update, {:id => post.to_param, :post => valid_attributes }#, valid_session
          assigns(:post).should eq(post)
        end

        it "redirects to the post" do
          post = Post.create! valid_attributes
          put :update, {:id => post.to_param, :post => valid_attributes }#, valid_session
          response.should redirect_to(post)
        end
      end

      context "unauthenticated" do
        it "redirect to session#new" do
          sign_out user
          post = Post.create! valid_attributes
          put :update, { id: post.to_param, post: valid_attributes }
          response.should redirect_to new_user_session_path
        end
      end
    end

    describe "with invalid params" do
      context "authenticated" do
        before(:each) { sign_in user }

        it "assigns the post as @post" do
          post = Post.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Post.any_instance.stub(:save).and_return(false)
          put :update, {:id => post.to_param, :post => {  } }#, valid_session
          assigns(:post).should eq(post)
        end

        it "re-renders the 'edit' template" do
          post = Post.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Post.any_instance.stub(:save).and_return(false)
          put :update, {:id => post.to_param, :post => {  } }#, valid_session
          response.should render_template("edit")
        end
      end

      context "unauthenticated" do
        it "redirect to session#new" do
          sign_out user
          post = Post.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Post.any_instance.stub(:save).and_return(false)
          put :update, {:id => post.to_param, :post => {  } }
          response.should redirect_to new_user_session_path
        end
      end
    end
  end

  describe "DELETE destroy" do
    context "authenticated" do
      before(:each) { sign_in user }
      it "destroys the requested post" do
        post = Post.create! valid_attributes
        expect {
          delete :destroy, { :id => post.to_param, section_id: section.id }#, valid_session
        }.to change(Post, :count).by(-1)
      end

      it "redirects to the posts list" do
        post = Post.create! valid_attributes
        delete :destroy, {:id => post.to_param, section_id: section.id }#, valid_session
        response.should redirect_to(section_posts_url(section))
      end
    end

    context "unauthenticated" do
      it "redirect to session#new" do
        post = Post.create! valid_attributes
        delete :destroy, {:id => post.to_param, section_id: section.id }#, valid_session
        sign_out user
        response.should redirect_to new_user_session_path
      end
    end
  end

end
