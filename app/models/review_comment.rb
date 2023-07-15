class ReviewComment < ApplicationRecord
  belongs_to :user
  belongs_to :zoo_review
end
