class Course < ApplicationRecord

  # association relations
  belongs_to :user
  has_many :lectures

end
