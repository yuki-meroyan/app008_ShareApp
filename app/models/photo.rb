class Photo < ApplicationRecord
  # belongs_to  :detail, inverse_of: :photos
  belongs_to  :detail
  mount_uploader :image, ImageUploader
end
