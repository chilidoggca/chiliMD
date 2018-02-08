class User < ApplicationRecord
  include Taggable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :media, dependent: :nullify
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :taggings, as: :taggable, dependent: :destroy
  has_many :tags, as: :taggable, through: :taggings

  has_many :likes, dependent: :destroy
  has_many :liked_likeables, through: :likes, source: :likeable

  has_many :votes, dependent: :destroy
  has_many :voted_comments, through: :votes, source: :comment

  has_many :reviewlists, dependent: :destroy
  has_many :reviewlisted_reviewables, through: :reviewlists, source: :reviewable

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  attachment :profile_image, destroy: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

  validates :first_name, :last_name, presence: true

  before_create :generate_api_key

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history, :finders]

  def slug_candidates
    [:first_name, :last_name]
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def images
    self.media.images
  end

  def audios
    self.media.audios
  end

  def videos
    self.media.videos
  end

  def contributions
    self.media.to_a.concat(self.posts).sort{|x,y|y.created_at - x.created_at} #not quite working as intended
  end

  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def self.search_term_desc(term)
    where("first_name ilike :search_term OR last_name ilike :search_term", search_term: "%#{term}%").order(created_at: :desc)
  end

  def self.from_omniauth(access_token)
  data = access_token.info
  user = User.where(email: data['email']).first

  # Uncomment the section below if you want users to be created if they don't exist
  unless user
    puts data
     user = User.create(first_name: data['first_name'],
        last_name: data['last_name'],
        email: data['email'],
        password: Devise.friendly_token[0,20]
     )
    end
    user
  end

  private
  def generate_api_key
    # We may accidentally generate an api key that a user already owns. To
    # prevent saving a duplicate, we'll loop until we can't find any users with
    # that key.
    loop do
      # SecureRandom.hex(32) will generate a large string of random hex characters.
      # (i.e. A-F & 0-9). We'll use this as the user's api key for
      # authentification with our web api.
      self.api_key = SecureRandom.hex(32)
      break unless User.exists?(api_key: api_key)
    end
  end

end
