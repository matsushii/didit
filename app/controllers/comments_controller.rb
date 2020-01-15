class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to request.referrer, notice: "コメントを投稿しました"
    else
      @post = Post.find(params[:post_id])
      redirect_to post_path(@post.id), alert: "コメントの投稿に失敗しました"
    end
  end

  private

  def comment_params
    params.permit(:text,:post_id).merge(user_id: current_user.id)
  end
end
