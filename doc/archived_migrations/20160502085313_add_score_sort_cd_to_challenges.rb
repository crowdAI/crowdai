class AddScoreSortCdToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :score_sort_cd, :string
    add_column :challenges, :score_secondary_sort_cd, :string
  end
end
