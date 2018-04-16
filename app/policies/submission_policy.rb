class SubmissionPolicy < ApplicationPolicy

  def index?
    participant && (participant.admin? ||
      @record.participant_id == participant.id ||
      @record.challenge.organizer_id == participant.organizer_id )
  end

  def show?
    true
  end

  def new?
    ChallengePolicy.new(participant, @record.challenge).submissions_allowed?
  end

  def create?
    new?
  end

  def edit?
    participant && (participant.admin? ||
      @record.challenge.organizer_id == participant.organizer_id )
  end

  def update?
    edit?
  end

end
