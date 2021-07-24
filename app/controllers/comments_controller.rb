class CommentsController < ApplicationController
  def create
    comment = current_user.comments.create(comment_params)
    redirect_to target_path(comment.target)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, target_id: params[:target_id])
  end
end
