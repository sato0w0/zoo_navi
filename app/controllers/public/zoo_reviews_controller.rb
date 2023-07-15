class Public::ZooReviewsController < ApplicationController

  def show
    @zoo_review = ZooReview.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def index
    @zoo_reviews = ZooReview.all.order(params[:sort])
    @zoo_review = ZooReview.new
  end

  def create
    @zoo_review = ZooReview.new(zoo_review_params)
    @zoo_review.user_id = current_user.id
    @zoo_review.zoo_id = params[:zoo_id]
    if @zoo_review.save
      redirect_to zoo_zoo_review_path(@zoo_review)
    else
      @zoo_reviews = ZooReview.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @zoo_review.update(zoo_review_params)
      redirect_to zoo_zoo_review_path(@zoo_review), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @zoo_review.destroy
    redirect_to zoo_zoo_reviews_path
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
