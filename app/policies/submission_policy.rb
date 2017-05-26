class SubmissionPolicy < ApplicationPolicy

  def index?
    participant
  end

  def show?
    participant
  end

end
