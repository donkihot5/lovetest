class Like < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates_uniqueness_of :user, scope: :song

end
