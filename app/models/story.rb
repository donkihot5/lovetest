class Story < ApplicationRecord
  
  #adding the paperclip dependencies to the stories page in order to upload images to the stories
  has_attached_file :story_image, styles: { large: "600x600>", medium: "300x300", thumb: "100x100>" }
  validates_attachment_content_type :story_image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) } #newest story to be displayed first


end
