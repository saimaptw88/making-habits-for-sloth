class AddUserIdToPurpose < ActiveRecord::Migration[6.0]
  def change
    add_reference :purposes, :user, null: false, default: "", foreign_key: true, index: true
  end
end
