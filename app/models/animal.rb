class Animal < ApplicationRecord
  has_many :zoo_animals
  has_many :zoos, through: :zoo_animals
  belongs_to :animal_type
  has_one_attached :image

  validates :image,       presence: true
  validates :name,        presence: true
  validates :animal_type, presence: true
  validates :habitat,     presence: true
  validates :body_length, presence: true
  validates :body_weight, presence: true
  validates :feature,     presence: true

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
