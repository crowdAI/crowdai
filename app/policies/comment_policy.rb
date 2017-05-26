class CommentPolicy < ApplicationPolicy

  def new?
    participant
  end

  def create?
    participant
  end

end
