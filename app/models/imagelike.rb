class Imagelike < ApplicationRecord
  belongs_to :user
  belongs_to :gallery

  validates_uniqueness_of :user, scope: :gallery 

end