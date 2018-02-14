class CreateImagelikes < ActiveRecord::Migration[5.1]
  def change
    create_table :imagelikes do |t|
    	t.boolean :imagelike
      	t.references :user, foreign_key: true
      	t.references :gallery, foreign_key: true

      	t.timestamps
    end
  end
end
