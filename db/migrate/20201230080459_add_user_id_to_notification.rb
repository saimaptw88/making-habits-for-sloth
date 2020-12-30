class AddUserIdToNotification < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :user, null: false, default: "", foreign_key: true, index: true
  end
end
