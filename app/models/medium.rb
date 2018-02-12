class Medium < ApplicationRecord
  include Taggable

  attachment :attachment_file
  belongs_to :user
  belongs_to :post, optional: true
  has_many :comments, as: :commentable, dependent: :nullify

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, as: :taggable, through: :taggings

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
    :attachment_file,
    presence: true
  )

  before_validation :capitalize, :set_media_type, :set_description

  scope :created_at_desc, -> {order(created_at: :desc)}
  scope :images, -> {where(is_image: true)}
  scope :audios, -> {where(is_audio: true)}
  scope :videos, -> {where(is_video: true)}

  def set_media_type
    if self.attachment_file_content_type.include? 'image'
      self.is_image = true
    elsif self.attachment_file_content_type.include? 'audio'
      self.is_audio = true
    elsif self.attachment_file_content_type.include? 'video'
      self.is_video = true
    end
  end

  def self.search_term_desc(term)
    where("title ilike :search_term OR description ilike :search_term", search_term: "%#{term}%").order(created_at: :desc)
  end

  def capitalize
    self.title&.capitalize!
  end

  def set_description
    self.description ||= ""
  end

  self.per_page = 12

end
