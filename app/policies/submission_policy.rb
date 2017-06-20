class SubmissionPolicy < ApplicationPolicy

  def index?
    participant
  end

  def show?
    participant
  end

  def destroy?
    participant && participant.admin?
  end

end
