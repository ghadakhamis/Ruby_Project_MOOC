class Course < ApplicationRecord

  # validation 
  validates :title, :user_id, presence: true
  validates :title, uniqueness: true

  # association relations
  belongs_to :user
  has_many :lectures

end
