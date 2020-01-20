class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      respond_to do |format|
        format.json
      end
    else
      redirect_to root_path, alert: "いいねできませんでした"
    end
  end

  def destroy
    @like = current_user.likes.find_by(post_id: params[:post_id])
    if  @like.destroy
      respond_to do |format|
        format.json
      end
    else
      redirect_to root_path, alert: "いいねを取り消せません"
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])    
  end
  
  def like_params
    params.permit(:post_id)
  end
end
