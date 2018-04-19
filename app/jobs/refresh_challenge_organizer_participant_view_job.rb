class RefreshChallengeOrganizerParticipantViewJob < ApplicationJob
  queue_as :default

  def perform
    Scenic.database.refresh_materialized_view('challenge_organizer_participants')
  end
end
