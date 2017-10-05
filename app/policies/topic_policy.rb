class TopicPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def new?
    participant
  end

  def create?
    new?
  end

  def destroy?
    participant && participant.admin
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

end
