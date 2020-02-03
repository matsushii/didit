class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:user).order(created_at: "DESC").limit(10)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿が完了しました"
    else
      @posts = Post.all.order(created_at: "DESC")
      flash.now[:alert] = "投稿に失敗しました"
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id && @post.destroy
      redirect_to request.referrer, notice: "投稿を削除しました"
    else
      flash.now[:alert] = "削除に失敗しました"
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, images: []).merge(user_id: current_user.id)
  end 
end
