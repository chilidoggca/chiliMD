class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings
  has_many :media, through: :taggings
end
