class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.references :competition, index: true, foreign_key: true
      t.integer :seq
      t.string :event
      t.datetime :event_time

      t.timestamps null: false
    end
  end
end
