class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
  @posts = Post.paginate(page: params[:page], per_page: 2)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Стаття вдало створена'
    else
      flash.now[:danger] = 'Стаття не створена'
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Стаття вдало обновлена'
    else
      flash.now[:danger] = 'Стаття не обновлена'
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Стаття вдало видалена'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id)
  end
end
