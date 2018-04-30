class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.references :participant, foreign_key: true
      t.string :title
      t.text :body
      t.boolean :published
      t.integer :vote_count
      t.integer :view_count

      t.timestamps
    end
  end
end
