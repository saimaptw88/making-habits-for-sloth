class AddPurposeIdToNotification < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :purpose, null: false, default: "", foreign_key: true, index: true
  end
end
