class Lecture < ApplicationRecord
   # validation 
   validates :attachment, presence: true
  # association relations
  belongs_to :course

  # make attachment belongs to Uploader
  mount_uploader :attachment, AttachmentUploader
end
