class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    post = Post.new
    post.title = params[:title]
    post.body = params[:body]
    post.author = "#{session[:username].titleize} Force"
    post.save!
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.title = params[:post][:title]
    post.body = params[:post][:body]
    post.save!
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end
end