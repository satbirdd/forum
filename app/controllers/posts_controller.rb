class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    # @section = Section.find(params[:section_id])
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # @section = Section.find(params[:section_id])
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @section = Section.find(params[:section_id])
    @post = @section.posts.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @section = Section.find(params[:section_id])
    @post = @section.posts.build(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to (section_post_path(@section, @post)), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to [@section, @post], notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to section_posts_url(@section) }
      format.json { head :no_content }
    end
  end
end
