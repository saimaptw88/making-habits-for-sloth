class CreatePurposes < ActiveRecord::Migration[6.0]
  def change
    create_table :purposes do |t|
      t.string :title
      t.integer :term, null: false, default: 66
      t.integer :time, null: false, default: 1

      t.timestamps
  end
  end
end
