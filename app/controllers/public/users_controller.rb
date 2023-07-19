class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if  @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def withdraw_confirm
    @user = current_user
  end

  def withdraw
    user = current_user
    if params[:commit] == "退会する"
      user.update(is_active: false)
      sign_out(user)
      flash[:notice] = "退会処理が完了しました。ご利用ありがとうございました。"
      redirect_to root_path
    elsif params[:commit] == "退会しない"
      flash[:notice] = "退会処理がキャンセルされました。"
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :is_active)
  end

end
