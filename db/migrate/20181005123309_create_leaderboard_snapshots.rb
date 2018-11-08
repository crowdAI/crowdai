class CreateLeaderboardSnapshots < ActiveRecord::Migration[5.2]
  def change
    create_table :leaderboard_snapshots do |t|
      t.references :challenge
      t.references :challenge_round
      t.references :participant
      t.integer :row_num
      t.integer :previous_row_num
      t.string :slug
      t.string :name
      t.integer :entries
      t.float :score
      t.float :score_secondary
      t.string :leaderboard_type_cd
      t.datetime :refreshed_at
      t.references :submission, foreign_key: true
      t.boolean :post_challenge
      t.integer :seq
      t.boolean :baseline
      t.string :baseline_comment

      t.timestamps
    end
  end
end
