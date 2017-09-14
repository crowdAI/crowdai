class RenameVideoOnLeaderboard < ActiveRecord::Migration[5.0]
  def change
    rename_column :challenges, :video_on_leaderboard, :media_on_leaderboard
  end
end
