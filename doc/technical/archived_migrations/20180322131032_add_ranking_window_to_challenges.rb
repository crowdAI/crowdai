class AddRankingWindowToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :ranking_window, :integer
  end
end
