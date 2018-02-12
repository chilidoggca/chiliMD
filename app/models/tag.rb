class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings, source: :taggable, source_type: 'Post'
  has_many :media, through: :taggings, source: :taggable, source_type: 'Medium'
  has_many :users, through: :taggings, source: :taggable, source_type: 'User'

  validates :name, presence: true, uniqueness: true

  before_validation :titleize

  def titleize
    self.name = self.name&.titleize
  end

  def self.search_term_desc(term)
    where("name ilike :search_term", search_term: "%#{term}%").order(created_at: :desc)
  end

end
