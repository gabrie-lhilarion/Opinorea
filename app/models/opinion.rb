class Opinion < ApplicationRecord
  belongs_to :user
  validates :comment, presence: true
  validates_length_of :comment, maximum: 100, message: "Message can not be empty and should be less than 101 characters"

  scope :recent, ->(ids) { where(id: ids); order(created_at: :desc) }
  scope :ordered_desc, -> { where(created_at: :desc) }
end
