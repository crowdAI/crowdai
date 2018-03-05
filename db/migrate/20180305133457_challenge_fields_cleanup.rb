class ChallengeFieldsCleanup < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenges, :current_challenge_round_id
    remove_column :challenges, :submission_limit
    remove_column :challenges, :submission_limit_period_id
  end
end
