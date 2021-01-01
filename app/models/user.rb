class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  
  has_many :opinions
  has_many :followings

  validates_presence_of :fullname, :photo, :cover_image
  validates_uniqueness_of :email, :username, case_sensitive: false 
  validates_associated :opinions, :followings
end
