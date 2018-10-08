class AddParallelSubmissionsToChallengeRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :challenge_rounds, :parallel_submissions, :integer, default: 0, null: false
    execute "update challenge_rounds set parallel_submissions = 0;"
  end
end
