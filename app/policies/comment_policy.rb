class CommentPolicy < ApplicationPolicy

  def new?
    true
  end

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
    participant && participant.admin?
  end

end
