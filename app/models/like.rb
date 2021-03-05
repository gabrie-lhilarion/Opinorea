class Like < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  scope :liked, ->(opinion, user) { where("opinion_id = ? AND user_id = ?", opinion, user) }
end
