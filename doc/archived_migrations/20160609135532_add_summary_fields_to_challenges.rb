class AddSummaryFieldsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :participant_count, :integer, default: 0
    add_column :challenges, :submission_count, :integer, default: 0
    drop_view :challenge_views
  end
end
