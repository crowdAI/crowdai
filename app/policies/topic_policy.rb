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

end
