class Opinion < ApplicationRecord
  belongs_to :user 
  validates_length_of :comment, maximum: 100, message: "Message can not be empty and should be less than 101 characters"
end
