class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to photo_path(@comment.photo), notice: "Comment added!"
    else
      redirect_to photo_path(@comment.photo), alert: "Failed to add comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:photo_id, :body)
  end
end
