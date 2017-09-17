class RenameCompetitionsToChallenges < ActiveRecord::Migration
  def self.up
    rename_table :competitions, :challenges
  end
  def self.down
    rename_table :challenges, :competitions
  end
end
