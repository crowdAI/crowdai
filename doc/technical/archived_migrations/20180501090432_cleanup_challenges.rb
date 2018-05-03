class CleanupChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :require_registration, :boolean, default: false
    remove_column :challenges, :grading_factor
    remove_column :challenges, :threshold
    remove_column :challenges, :daily_submissions
  end
end
