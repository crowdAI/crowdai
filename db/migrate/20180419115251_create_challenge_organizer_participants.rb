class CreateChallengeOrganizerParticipants < ActiveRecord::Migration[5.0]
  def change
    create_view :challenge_organizer_participants, materialized: true
  end
end
