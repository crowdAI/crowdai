class AddWinnerDescriptionToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :winner_description_markdown, :text
    add_column :challenges, :winner_description, :text
    add_column :challenges, :winners_tab_active, :boolean, default: false
  end
end
