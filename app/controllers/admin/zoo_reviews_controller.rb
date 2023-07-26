class Admin::ZooReviewsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @user = User.find(params[:user_id])
    @zoo_review = ZooReview.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def index
    @zoo = Zoo.find(params[:zoo_id])
    @zoo_reviews = @zoo.zoo_reviews.order(params[:sort])
    @zoo_review = ZooReview.new
  end

  def destroy
    @user = User.find(params[:user_id])
    @zoo_review = ZooReview.find(params[:id])
    @zoo_review.destroy
    redirect_to admin_user_path(@user.id)
  end

  private

  def zoo_review_params
    params.require(:zoo_review).permit(:title, :body, :rate, :user_id, :zoo_id)
  end

  def ensure_correct_user
    @zoo_review = ZooReview.find(params[:id])
    unless @zoo_review.user == current_user
      redirect_to zoo_zoo_reviews_path
    end
  end

end