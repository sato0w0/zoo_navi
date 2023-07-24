class Public::ReviewCommentsController < ApplicationController

  def create
    zoo_review = ZooReview.find(params[:zoo_review_id])
    @comment = current_user.review_comments.new(review_comment_params)
    @comment.zoo_review_id = zoo_review.id
    @comment.save
    redirect_to request.referer
  end

  def destroy
    @zoo = Zoo.find(params[:zoo_id])
    @zoo_review = ZooReview.find(params[:zoo_review_id])
    @comment = current_user.review_comments.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private
  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end

end
