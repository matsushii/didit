class UsersController < ApplicationController
  def edit 
  end

  def update
    if current_user.update(user_params)
      redirect_to request.referrer, notice: "情報を変更しました"
    else
      flash.now[:alert] =  "更新に失敗しました"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :email)
  end
end
