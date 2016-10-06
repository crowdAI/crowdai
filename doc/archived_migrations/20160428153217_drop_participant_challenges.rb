class DropParticipantChallenges < ActiveRecord::Migration
  def change
    drop_table :participant_challenges
  end
end
