class Public::ZooReviewsController < ApplicationController

  def show
    @zoo = Zoo.find(params[:zoo_id])
    @zoo_review = ZooReview.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def index
    @zoo = Zoo.find(params[:zoo_id])
    @zoo_reviews = @zoo.zoo_reviews.order(params[:sort])
    @zoo_review = ZooReview.new
  end

  def new
    @zoo = Zoo.find(params[:zoo_id])
    @zoo_review = ZooReview.new
  end

  def create
    @zoo_review = ZooReview.new(zoo_review_params)
    @zoo_review.user_id = current_user.id
    @zoo_review.zoo_id = params[:zoo_id]
    if @zoo_review.save
      redirect_to zoo_zoo_review_path(@zoo_review.zoo, @zoo_review)
    else
      @zoo_reviews = ZooReview.all
      render 'index'
    end
  end

  def edit
    @zoo = Zoo.find(params[:zoo_id])
    @zoo_review = ZooReview.find(params[:id])
  end

  def update
    @zoo = Zoo.find(params[:zoo_id])
    @zoo_review = ZooReview.find(params[:id])
    if @zoo_review.update(zoo_review_params)
      redirect_to zoo_zoo_review_path(@zoo, @zoo_review)
    else
      render "edit"
    end
  end

  def destroy
    @zoo_review = ZooReview.find(params[:id])
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
