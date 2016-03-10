class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :post
      t.integer :votes, default: 0
      t.boolean :flagged, default: false
      t.boolean :notify, default: true

      t.timestamps null: false
    end
  end
end
