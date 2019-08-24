class Image < ApplicationRecord
  belongs_to  :detail, optional: true
end
