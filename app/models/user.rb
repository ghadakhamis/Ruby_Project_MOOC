
class User < ApplicationRecord
  validates :name, presence: true, length: {minimum:3, maximum:250}
  validates :date_of_birth, :gender, presence: true
  mount_uploader :profile_picture, ProfilePictureUploader
  enum gender: {male: 0, female: 1}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
