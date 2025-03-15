class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :email, unique: true
      t.string :encrypted_password
      t.boolean :private, default: false
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
