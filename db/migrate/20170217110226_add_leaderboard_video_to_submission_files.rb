class AddLeaderboardVideoToSubmissionFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :submission_files, :leaderboard_video, :boolean, default: false
    execute 'update submission_files set leaderboard_video = false;'
  end
end
