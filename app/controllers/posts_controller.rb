class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    author = "#{session[:username].titleize} Force"
    post.author = author
    post.save!
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update_attributes(post_params)
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private

  def post_params
    p params
    params.require(:post).permit(:title, :body, :author, :created_at)
  end
end