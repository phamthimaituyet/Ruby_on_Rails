class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @group_id = params[:group_id]         # lay group_id 
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.group_id = params[:group_id]
    current_user.count_post = current_user.posts.count + 1

    respond_to do |format|
      if @post.save
        current_user.save
        @group_id = params[:group_id]
        if !@group_id.nil?                             # neu ton tai group_id -> tao post trong group 
          @group = Group.find(@group_id)
          format.html { redirect_to group_url(@group), notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        else                                                 # tao post trong post 
          format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    current_user.count_post = current_user.posts.count

    current_user.save

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    private
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end
