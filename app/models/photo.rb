class Photo < ApplicationRecord
  belongs_to  :detail, inverse_of: :photos
  mount_uploaders :image, ImageUploader
end
