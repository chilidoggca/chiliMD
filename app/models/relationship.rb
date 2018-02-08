class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  validate :doesnt_follow_self

  private
  def doesnt_follow_self
    errors.add(:base, 'You can\'t follow yourself') if follower == followed
  end
end
