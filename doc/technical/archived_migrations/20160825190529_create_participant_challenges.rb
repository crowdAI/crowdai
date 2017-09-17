class CreateParticipantChallenges < ActiveRecord::Migration
  def change
    execute "drop view participant_challenges"
    create_view :participant_challenges
  end
end
