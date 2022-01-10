class AddReasonToBlockedUser < ActiveRecord::Migration[6.1]
  def change
    add_column :blocked_users, :reason, :text
  end
end
