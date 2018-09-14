class AddFailedSubmissionsToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_rounds, :failed_submissions, :integer, default: 0
    execute "update challenge_rounds set failed_submissions = 0;"
  end
end
