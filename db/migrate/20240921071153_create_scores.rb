class CreateScores < ActiveRecord::Migration[7.2]
  def change
    create_table :scores do |t|
      t.string :name, null: false
      t.integer :value, null: false, default: 0

      t.timestamps
    end
  end
end
