class Admin::ReviewCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @zoo_review = ZooReview.find(params[:zoo_review_id])
    @comment = @zoo_review.review_comments.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private
  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end
