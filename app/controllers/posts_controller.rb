class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create_with_user(post_params, current_user)
    @post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :image)
  end

end
