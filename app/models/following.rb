class Following < ApplicationRecord
  belongs_to :user

  def self.first_follower(user)
    where(user_id: user).first
  end

  def self.followers(user)
    where(user_id: user)
  end

  def self.following(user)
    where(follower_id: user)
  end

  def self.not_follower?(followed, follower)
    count = where(user_id: followed, follower_id: follower).count
    count.zero?
  end

  def self.a_follower?(followed, follower)
    count = where(user_id: followed, follower_id: follower).count
    count.positive?
  end

  def self.following_record(followed, follower)
    follower = where(user_id: followed, follower_id: follower)
    follower.ids
  end
end
