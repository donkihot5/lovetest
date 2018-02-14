class Song < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) } #newest songs to be displayed first

  has_many :comments, dependent: :destroy, as: :commentable
  has_many :likes, dependent: :destroy

  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size    
  end

end
