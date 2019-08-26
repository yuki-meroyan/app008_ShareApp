class Detail < ApplicationRecord

  belongs_to :genre
  belongs_to :user
  has_many   :photos, inverse_of: :detail, dependent: :destroy
  accepts_nested_attributes_for :photos
  # belongs_to :genre, through: :infos
  # belongs_to :user, through: :infos
  # has_many :images, through: :infos
  # has_many :infos
  
end
