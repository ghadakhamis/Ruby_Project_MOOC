class Course < ApplicationRecord

  # validation 
  validates :title, :user_id, presence: true

  # association relations
  belongs_to :user
  has_many :lectures

end
