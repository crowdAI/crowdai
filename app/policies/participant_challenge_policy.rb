class ParticipantChallengePolicy < ApplicationPolicy

  def index?
    participant && (participant.admin? || @record.organizer_id == participant.organizer_id)
  end

end
