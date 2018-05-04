module OrganizersHelper

  def organizer_badge?(challenge_id:,participant_id:)
    challenge = Challenge.find(challenge_id)
    participant = Participant.find(participant_id)
    return true if challenge.organizer_id == participant.organizer_id
  end

end
