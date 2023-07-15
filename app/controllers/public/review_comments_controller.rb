class Public::ReviewCommentsController < ApplicationController

  def create
    zoo_review = ZooReview.find(params[:zoo_review_id])
    @comment = current_user.review_comments.new(review_comment_params)
    @comment.zoo_review_id = zoo_review.id
    @comment.save
  end

  def destroy
    @comment = ReviewComment.find_by(id: params[:id], zoo_review_id: params[:zoo_review_id])
    @comment.destroy
  end

  private
  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end

end
