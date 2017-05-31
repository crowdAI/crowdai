class DatasetFilePolicy < ApplicationPolicy

  def new?
    participant && (participant.admin? || @record.challenge.organizer_id == participant.organizer_id)
  end

  def create?
    new?
  end

  def destroy?
    new?
  end

  def index?
    participant
  end

end
