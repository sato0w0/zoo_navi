class Zoo < ApplicationRecord
  has_many :zoo_animals, dependent: :destroy
  has_many :zoo_reviews, dependent: :destroy
  has_many :animals,     through: :zoo_animals
  has_one_attached :image

  validates :image,            presence: true
  validates :name,             presence: true
  validates :description,      presence: true
  validates :region,           presence: true
  validates :address,          presence: true
  validates :opening_hours,    presence: true
  validates :closing_day,      presence: true
  validates :admission,        presence: true
  validates :telephone_number, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def get_image_fit(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fit: [width, height]).processed
  end

  def get_image_fill(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end
end
