class RenameUserCompetitions < ActiveRecord::Migration
  def change
    rename_table :user_competitions, :user_challenges
  end
end
