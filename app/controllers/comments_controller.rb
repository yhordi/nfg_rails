class CommentsController < ApplicationController
  include ErrorsHelper

  def create
    comment = Comment.new(comment_params)
    comment.post_id = params[:post_id]
    if comment.valid?
      comment.save!
      redirect_to post_path(params[:post_id])
    else
      show_errors(comment)
      redirect_to post_path(params[:post_id])
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end