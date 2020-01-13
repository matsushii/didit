class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to request.referrer, notice: "コメントを投稿しました"
    else
      flash.now[:alert] = "コメントの投稿に失敗しました"
      render controller: post, action: index
    end
  end

  private

  def comment_params
    params.permit(:text,:post_id).merge(user_id: current_user.id)
  end
end
