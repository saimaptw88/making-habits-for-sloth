class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, default: ""
      t.integer :actual_time, null: false, default: 1

      t.timestamps
    end
  end
end
