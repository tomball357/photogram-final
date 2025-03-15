class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :private, :boolean, default: false
    add_column :users, :likes_count, :integer, default: 0
    add_column :users, :comments_count, :integer, default: 0

    add_index :users, :username, unique: true
  end
end
