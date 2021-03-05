class Dislike < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  scope :disliked, ->(opinion, user) { where("opinion_id = ? AND user_id = ?", opinion, user) }
end
