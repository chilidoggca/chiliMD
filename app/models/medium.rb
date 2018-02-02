class Medium < ApplicationRecord
  attachment :attachment_file
  belongs_to :user
  belongs_to :post, optional: true
  has_many :comments, as: :commentable, dependent: :nullify

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, as: :taggable, through: :taggings

  validates(
    :title,
    presence: true
  )

  validates(
    :attachment_file,
    presence: true
  )

  before_validation :capitalize, :set_media_type

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

  def capitalize
    self.title&.capitalize!
  end

end
