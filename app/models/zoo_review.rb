class ZooReview < ApplicationRecord
  belongs_to :user
  belongs_to :zoo
  has_many :review_comments, dependent: :destroy

  validates :title, presence: true
  validates :body,  presence: true
  validates :rate,  presence: true

  def self.search_for(content, method)
    if method == 'partial'
      ZooReview.where('title LIKE ? OR body LIKE ?', "%#{content}%", "%#{content}%")
    else
      ZooReview.where('title = ? OR body = ?', content, content)
    end
  end
end