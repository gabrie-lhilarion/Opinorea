class Following < ApplicationRecord
  belongs_to :user

 
  def self.first_follower(user) 
    where("user_id = #{user}").first
  end
end
