class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :rememberable
  validates_presence_of :fullname, :photo, :cover_image
  validates_uniqueness_of :email, :username, case_sensitive: false 
  validates_associated :opinions, :followings
  
  has_many :opinions, dependent: :destroy 
  has_many :followings, dependent: :destroy
  
  has_one_attached :photo
  has_one_attached :cover_image  

  def recent_conversations
    ids = followings.select(:id).ids
    ids << id
    Opinion.recent(ids)
  end

  def who_to_follow
    ids = followings.ids 
    User.not_following(ids)
  end
  
  scope :ordered_users, -> { order(created_at: :desc) }
  scope :user_and_following, ->(ids) { where(id: ids) }
  scope :not_following, ->(ids) { where.not(id: ids) }
end
