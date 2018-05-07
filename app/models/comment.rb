class Comment < ApplicationRecord
  
  # validation 
  validates :comment, presence: true, length: {minimum:2, maximum:250}
  validates :user_id, :lecture_id, presence: true
  # association relations
  belongs_to :user
  belongs_to :lecture

end
