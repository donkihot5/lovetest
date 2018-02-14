class Gallery < ApplicationRecord

  has_attached_file :gallery_image, styles: { medium: "200x200"}
  validates_attachment_content_type :gallery_image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) } #newest image to be displayed first

  has_many :imagecomments, dependent: :destroy, as: :commentable
  has_many :imagelikes, dependent: :destroy


  def image_thumbs_up_total
    self.imagelikes.where(imagelike: true).size
  end
  
  def image_thumbs_down_total
    self.imagelikes.where(imagelike: false).size    
  end

end
