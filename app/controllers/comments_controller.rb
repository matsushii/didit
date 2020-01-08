class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.permit(:text,:post_id).merge(user_id: current_user.id)
  end
end
