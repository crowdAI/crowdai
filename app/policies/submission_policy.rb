class SubmissionPolicy < ApplicationPolicy

  def index?
    participant && (participant.admin? ||
      @record.participant_id == participant.id ||
      @record.challenge.organizer_id == participant.organizer_id )
  end

  def show?
    true
  end

end
