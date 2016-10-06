class OtherCompetitionFields < ActiveRecord::Migration
  def change
    drop_view :leaderboards
    rename_column :challenges, :competition, :challenge
    rename_column :dataset_files, :competition_id, :challenge_id
    rename_column :submissions, :competition_id, :challenge_id
    rename_column :timelines, :competition_id, :challenge_id
    rename_column :topics, :competition_id, :challenge_id
    rename_column :user_competitions, :competition_id, :challenge_id
  end
end
