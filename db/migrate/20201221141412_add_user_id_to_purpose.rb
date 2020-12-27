class AddUserIdToPurpose < ActiveRecord::Migration[6.0]
  def change
    add_reference :purposes, :user, null: false, default: "", foreign_key: true, index: true
    purposes = ["programing", "read books", "study English"]
    purposes.each do |i|
      Purpose.create(title: i, user_id: User.first.id)
    end
  end
end
