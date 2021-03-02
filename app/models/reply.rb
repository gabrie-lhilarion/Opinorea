class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :opinion
  
  validates_presence_of :content
  validates_length_of :content, maximum: 50, message: "Message should be less than 51 characters"
end
