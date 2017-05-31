class TopicPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def new?
    participant && (participant.admin? || @record.participant == participant)
  end

  def create?
    new?
  end

end
