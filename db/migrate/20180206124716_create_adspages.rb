class CreateAdspages < ActiveRecord::Migration[5.1]
  def change
    create_table :adspages do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :adspages, [:user_id, :created_at]
  end
end
