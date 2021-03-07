class Opinion < ApplicationRecord
  belongs_to :user
  has_many :dislikes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :replies, dependent: :destroy
  validates :comment, presence: true
  validates_length_of :comment, maximum: 50, message: 'Message can not be empty and should be less than 50 characters'

  scope :user_opinions, ->(id) { where(user_id: id) }
  scope :recent, ->(ids) { where(user_id: ids); order(created_at: :desc) }
  scope :ordered_desc, -> { where(created_at: :desc) }
end
