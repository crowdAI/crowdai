class CreateArticleSections < ActiveRecord::Migration
  def change
    create_table :article_sections do |t|
      t.references :article, index: true, foreign_key: true
      t.integer :seq, default: 1
      t.text :description_markdown
      t.text :description

      t.timestamps null: false
    end

    drop_table :tutorials
  end
end
