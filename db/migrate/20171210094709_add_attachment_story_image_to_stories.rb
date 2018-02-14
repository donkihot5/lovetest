class AddAttachmentStoryImageToStories < ActiveRecord::Migration[5.1]
  def self.up
    change_table :stories do |t|
      t.attachment :story_image
    end
  end

  def self.down
    remove_attachment :stories, :story_image
  end
end
