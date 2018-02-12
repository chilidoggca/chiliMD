class Reviewlist < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  acts_as_list
  validates :position, uniqueness: { scope: :user }

end
