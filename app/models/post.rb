class Post < ApplicationRecord
  include Taggable

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  # has_many :taggings, as: :taggable, dependent: :destroy
  # has_many :tags, as: :taggable, through: :taggings

  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true

  has_many :media, dependent: :nullify, inverse_of: :post
  accepts_nested_attributes_for :media, reject_if: :all_blank, allow_destroy: true

  has_many :references, as: :referenceable, dependent: :destroy, inverse_of: :referenceable
  accepts_nested_attributes_for :references, reject_if: :all_blank, allow_destroy: true

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  has_many :reviewlists, as: :reviewable, dependent: :destroy
  has_many :reviewers, through: :reviewlists, source: :user

  validates(
    :title,
    presence: true
  )

  validates(
    :body,
    presence: true
  )

  scope :created_at_desc, -> {order(created_at: :desc)}

  def self.search_term_desc(term)
    where("title ilike :search_term OR body ilike :search_term", search_term: "%#{term}%").order(created_at: :desc)
  end


end
