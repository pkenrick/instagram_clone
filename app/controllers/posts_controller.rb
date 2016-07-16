class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.create(restaurant_params)
    redirect_to '/posts'
  end

  private

  def restaurant_params
    params.require(:post).permit(:title)
  end

end
