class CreateBlockedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :blocked_users do |t|
      t.integer :blocker_id
      t.integer :blocked_id

      t.timestamps
    end
  end
end
