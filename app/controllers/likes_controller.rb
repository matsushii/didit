class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(post_id: params[:post_id])
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
      redirect_to root_path, alert: "いいねを取り消しました"
    else
      redirect_to root_path
    end
  end

end
