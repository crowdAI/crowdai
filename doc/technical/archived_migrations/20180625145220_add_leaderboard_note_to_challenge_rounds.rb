class AddLeaderboardNoteToChallengeRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_rounds, :leaderboard_note_markdown, :text
    add_column :challenge_rounds, :leaderboard_note, :text
  end
end
