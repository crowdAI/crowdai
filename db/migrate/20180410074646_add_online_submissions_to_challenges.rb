class AddOnlineSubmissionsToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :online_submissions, :boolean, default: false
    execute "update challenges set online_submissions = false;"
    execute "update challenges set online_submissions = true where id in ( 14,15,16,17,18,19,20,21,22,23,24);"
  end

end
