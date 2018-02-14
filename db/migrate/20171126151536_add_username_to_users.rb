class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change #anything inside this method will be translated to sql code and modified database currently postgresql
  	add_column :users, :username, :string #add a new column to the users table, called 'username'
  	add_index :users, :username, unique: true #ensures usernames are always unique and index usernames for quick lookup
  end
end
