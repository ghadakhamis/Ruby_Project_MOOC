
class User < ApplicationRecord
  acts_as_voter
  # validation 
  validates :name, presence: true, length: {minimum:3, maximum:250}
  validates :date_of_birth, :gender, presence: true

  # make profile picture belongs to Uploader
  mount_uploader :profile_picture, ProfilePictureUploader

  # determine values to gender field 
  enum gender: {male: 0, female: 1}
  
  # association relations
  has_many :courses
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
