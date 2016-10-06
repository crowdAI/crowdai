class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :comment
      t.references :participant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
