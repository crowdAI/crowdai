class AddSubmissionLimitToChallengeRounds < ActiveRecord::Migration[5.1]
  def change
    add_column :challenge_rounds, :submission_limit, :integer
    add_column :challenge_rounds, :submission_limit_period_cd, :string
  end
end
