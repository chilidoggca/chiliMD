class Reviewlist < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  acts_as_list
  validates :position, uniqueness: { scope: :user }

  before_validation :set_date_to_7_days

  def set_date_to_7_days
    if !self.start_date.present?
      self.start_date = 7.days.from_now
    end
  end

end
