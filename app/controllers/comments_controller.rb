class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_prarms)
    redirect_to "/targets/#{comment.target.id}"
  end

  private

  def comment_prarms
    params.require(:comment).permit(:text).merge(user_id: current_user.id, target_id: params[:target_id])
  end
end
