class SubmissionCommentPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    participant
  end

end
