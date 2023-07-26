class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = current_user
    @zoo_reviews = @user.zoo_reviews
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
      redirect_to root_path
    elsif params[:commit] == "退会しない"
      redirect_to user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :is_active)
  end

  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to user_path(current_user)
    end
  end

end
