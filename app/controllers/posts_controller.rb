class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
  end

  def show
    p session[:id]
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.body = params[:post][:body]
    post.title = params[:post][:title]
    post.save!
    redirect_to root_path
  end

  def destroy
  end
end