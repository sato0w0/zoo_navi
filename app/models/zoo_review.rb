class ZooReview < ApplicationRecord
  belongs_to :user
  belongs_to :zoo
  has_many :review_comments, dependent: :destroy

  def self.search_for(content, method)
    if method == 'perfect'
      ZooReview.where(title: content)
    elsif method == 'forward'
      ZooReview.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      ZooReview.where('title LIKE ?', '%'+content)
    else
      ZooReview.where('title LIKE ?', '%'+content+'%')
    end
  end

end
