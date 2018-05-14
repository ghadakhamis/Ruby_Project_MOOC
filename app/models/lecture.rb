class Lecture < ApplicationRecord
  acts_as_votable
  # validation 
  validates :attachment, :course_id, presence: true
 
  # association relations
  belongs_to :course
  has_many :comments
  has_many :users, through: :comments
  has_and_belongs_to_many :users   


  # make attachment belongs to Uploader
  mount_uploader :attachment, AttachmentUploader
end
