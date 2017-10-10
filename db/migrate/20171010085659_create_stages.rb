class CreateStages < ActiveRecord::Migration[5.1]
  def change
    create_table :stages do |t|
      t.references :challenge, foreign_key: true
      t.string :stage
      t.integer :seq, default: 0
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.boolean :active, default: false
      t.string :leaderboard_title

      t.timestamps
    end
  end
end
