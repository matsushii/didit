class PostsController < ApplicationController
  def index
    @posts = Post.all
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

  #editはなし、destroyはあり

  private
  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end 
end
