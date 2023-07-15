class Zoo < ApplicationRecord
  has_many :zoo_animals
  has_many :zoo_reviews
  has_many :animals, through: :zoo_animals
  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def self.search_for(word)
    unless word.blank?
      Animal.where("name LIKE ?", "%#{word}%")
    else
      Animal.where(name: word)
    end
  end
end
