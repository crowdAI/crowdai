class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :competition, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :topic
      t.boolean :sticky, default: false
      t.integer :views, default: 0
      t.integer :posts_count, default: 0

      t.timestamps null: false
    end
  end
end
