class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :article
      t.references :participant, index: true, foreign_key: true
      t.boolean :published, default: false
      t.integer :vote_count, default: 0

      t.timestamps null: false
    end
  end
end
