class AddUserIdTotask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :user, null: false, default: "", foreign_key: true, index: true
    user = User.first
    purposes = user.purposes.all
    purposes.each do |i|
      Task.create(title: i.title, purpose_id: i.id, user_id: user.id)
    end
  end
end
