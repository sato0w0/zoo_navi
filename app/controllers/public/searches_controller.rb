class Public::SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'zoo'
      @zoos = Zoo.search_for(@content, @method)
    elsif @model == 'zoo_review'
      @zoo_reviews = ZooReview.search_for(@content, @method)
    end
  end
end
