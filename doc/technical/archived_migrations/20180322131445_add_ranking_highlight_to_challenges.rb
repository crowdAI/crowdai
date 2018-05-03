class AddRankingHighlightToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :ranking_highlight, :integer
  end
end
