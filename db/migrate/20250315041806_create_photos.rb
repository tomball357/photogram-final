class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.text :caption
      t.string :image
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0
      t.integer :owner_id, foreign_key: true

      t.timestamps
    end
  end
end
