class Imagecomment < ApplicationRecord

	belongs_to :commentable, polymorphic: true
	has_many :imagecomments, as: :commentable

	#belongs_to :user
	#belongs_to :song
	#validates :user_id, presence: true
	validates :content, presence: true
	#validates :song_id, presence: true
	default_scope -> { order(created_at: :desc) } #newest comments to be displayed first

end
