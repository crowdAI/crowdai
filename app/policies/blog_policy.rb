class BlogPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    false
  end

  def update?
    edit?
  end

  def new?
    edit?
  end

  def create?
    edit?
  end

  def destroy?
    edit?
  end

  class Scope
    attr_reader :participant, :scope

    def initialize(participant, scope)
      @participant = participant
      @scope = scope
    end

    def resolve
      if participant && participant.admin?
        scope.all
      else
        if participant
          scope.where("published IS TRUE OR (published IS FALSE and participant_id = ?)", participant.id)
        else
          scope.where(published: true)
        end
      end
    end
  end

end
