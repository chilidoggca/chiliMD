class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings
  has_many :media, through: :taggings
  has_many :users, through: :taggings

  validates :name, presence: true, uniqueness: true

  before_validation :titleize

  def titleize
    self.name = self.name&.titleize
  end
end
