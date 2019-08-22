class Genre < ApplicationRecord

  has_many :details
  # has_many :details, through: :infos
  # has_many :infos

end
