class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  def votes_result
    votes.where({is_up: true}).count - votes.where({is_up: false}).count
  end

end
