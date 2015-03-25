class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    ap params
    comment = Comment.new
    comment.name = params[:comment][:name]
    comment.body = params[:comment][:body]
    comment.post_id = params[:post_id]
    if comment.valid?
      comment.save!
      ap "SAVED!"
      redirect_to post_path(params[:post_id])
    else
      flash.errors.full_messages
      redirect_to post_path(params[:post_id])
    end
  end
end