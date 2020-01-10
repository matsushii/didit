class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
      #投稿に成功しましたalart表示
    else
      redirect_to root_path
      #to_do: 投稿に失敗しましたalart表示
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id && @post.destroy
      redirect_to root_path
    else
      redirect_to root_path      
    end
  end

  private

  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end 
end
