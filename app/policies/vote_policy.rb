class VotePolicy < ApplicationPolicy

  def create?
    participant
  end

  def edit?
    participant && (participant.admin? || @record.participant == participant)
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

end
