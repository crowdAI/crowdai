class CreateLboards < ActiveRecord::Migration[5.1]
  def change
    create_table :lboards do |t|
      t.references :challenge, foreign_key: true
      t.references :challenge_round, foreign_key: true
      t.references :participant, foreign_key: true
      t.integer :row_num
      t.integer :previous_row_num
      t.string :slug
      t.string :name
      t.integer :entries
      t.float :score
      t.float :score_secondary
      t.string :media_large
      t.string :media_thumbnail
      t.string :media_content_type
      t.string :description
      t.string :description_markdown
      t.string :leaderboard_type_cd, index: true
      t.datetime :refreshed_at

      t.timestamps
    end
  end
end
