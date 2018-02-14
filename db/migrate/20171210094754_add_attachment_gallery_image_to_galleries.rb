class AddAttachmentGalleryImageToGalleries < ActiveRecord::Migration[5.1]
  def self.up
    change_table :galleries do |t|
      t.attachment :gallery_image
    end
  end

  def self.down
    remove_attachment :galleries, :gallery_image
  end
end
