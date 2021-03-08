class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :opinion

  validates_presence_of :content
  validates_length_of :content, maximum: 30, message: 'Message should be less than 31 characters'
end
