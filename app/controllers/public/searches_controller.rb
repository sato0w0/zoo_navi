class Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @method = params[:method]
    @zoo_reviews = ZooReview.search_for(@content, @method)
  end
end