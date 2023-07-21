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
  
  def get_image_fit(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fit: [width, height]).processed
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Zoo.where(name: content)
    elsif method == 'forward'
      Zoo.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Zoo.where('name LIKE ?', '%'+content)
    else
      Zoo.where('name LIKE ?', '%'+content+'%')
    end
  end
end
