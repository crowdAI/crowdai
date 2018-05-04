class AddGraderLogsToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :grader_logs, :boolean, default: false
    execute "update challenges set grader_logs = FALSE;"
  end
end
