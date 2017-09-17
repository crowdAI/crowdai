class AddOnlineGradingToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :online_grading, :boolean, default: true
    execute "update challenges set online_grading = true;"
  end
end
