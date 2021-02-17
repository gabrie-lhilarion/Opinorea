class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :rememberable
  validates_presence_of :fullname, :email, :username
  validates_uniqueness_of :email, :username, case_sensitive: false
  validates_associated :opinions, :followings

  has_many :opinions, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy

  has_one_attached :photo
  has_one_attached :cover_image

  def self.recent_conversations(user)
    ids = [user]
    followers = Following.select(:follower_id).where(user_id: user)
    followers.each { |follower| ids << follower.follower_id }
    Opinion.where(user_id: ids)
  end

  def self.recent_opinions(user) 
    Opinion.where(user_id: user)
  end

  def self.followed_by(user)
    User.find(user).followings.where.not(follower_id: user).order(created_at: :desc)
  end

  def self.who_to_follow(user)
    User.where.not(id: user).ids
  end

  scope :not_following, ->(ids) { where.not(id: ids) }
end
