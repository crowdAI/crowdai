class AddPostChallengeSubmissionsToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :post_challenge_submissions, :boolean, default: false 
    execute "update challenges set post_challenge_submissions = false;"
  end
end
