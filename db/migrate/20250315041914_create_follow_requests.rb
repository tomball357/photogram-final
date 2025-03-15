class CreateFollowRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :follow_requests do |t|
      t.integer :sender_id, foreign_key: true
      t.integer :recipient_id, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
