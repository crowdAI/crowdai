class AddDailySubmissionsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :daily_submissions, :integer
  end
end
