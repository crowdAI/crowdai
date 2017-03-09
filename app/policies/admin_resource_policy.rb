class AdminResourcePolicy < ApplicationPolicy

  def index?
    participant && participant.admin?
  end

  def show?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def destroy?
    index?
  end

end
