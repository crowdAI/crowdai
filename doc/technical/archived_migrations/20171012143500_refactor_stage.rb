class RefactorStage < ActiveRecord::Migration[5.1]
  def change
    rename_table :stages, :challenge_rounds
    rename_column :challenge_rounds, :stage, :challenge_round
    remove_column :challenge_rounds, :leaderboard_title
    add_column :submissions, :challenge_round_id, :integer
  end
end
