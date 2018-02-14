class CreateStatuspages < ActiveRecord::Migration[5.1]
  def change
    create_table :statuspages do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :statuspages, [:user_id, :created_at]
  end
end
