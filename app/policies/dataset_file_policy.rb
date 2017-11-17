class DatasetFilePolicy < ApplicationPolicy

  def index?
    participant
  end

  def new?
    participant && (participant.admin? || @record.challenge.organizer_id == participant.organizer_id)
  end

  def create?
    new?
  end

  def destroy?
    new?
  end

end
