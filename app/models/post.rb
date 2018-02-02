class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :nullify
  has_many :media, dependent: :nullify, inverse_of: :post
  has_many :references, dependent: :destroy

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, as: :taggable, through: :taggings

  accepts_nested_attributes_for :media, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :references, reject_if: :all_blank, allow_destroy: true

  validates(
    :title,
    presence: true
  )

  validates(
    :body,
    presence: true
  )

  scope :created_at_desc, -> {order(created_at: :desc)}


end
