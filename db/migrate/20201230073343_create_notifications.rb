class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
