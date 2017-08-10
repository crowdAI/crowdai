class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer  "followable_id",     null: false
      t.string   "followable_type",   null: false
      t.references :participant, foreign_key: true

      t.timestamps
    end
  end
end
