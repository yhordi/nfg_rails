class CommentsController < ApplicationController
  def index
    ap params
    @comments = Post.find(params[:post_id]).comments
    ap @comments
    # @post_comments(@comments)
  end
end