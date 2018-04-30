class BlogPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    @record.published || (participant && (participant.admin? || @record.participant_id == participant.id))
  end

  def edit?
    false
  end

  def update?
    false
  end

  def new?
    false
  end

  def create?
    false
  end

  def destroy?
    false
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
