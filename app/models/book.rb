class Book < ApplicationRecord
    
    has_one_attached :image
    belongs_to :user
    
    
    def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
    end
    
     validates :title,presence: true 
  
     validates :body,presence:true ,length:{maximum:200}
end