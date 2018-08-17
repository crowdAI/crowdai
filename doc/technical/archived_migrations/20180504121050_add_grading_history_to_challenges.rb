class AddGradingHistoryToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :grading_history, :boolean, default: false
    execute "update challenges set grading_history = FALSE;"
  end
end
