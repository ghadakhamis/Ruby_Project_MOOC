class Lecture < ApplicationRecord
  acts_as_votable
  # validation 
  validates :attachment, :course_id, presence: true
 
  # association relations
  belongs_to :course
  has_many :comments

  # make attachment belongs to Uploader
  mount_uploader :attachment, AttachmentUploader
end
