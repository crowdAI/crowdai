class MemberPolicy < ApplicationPolicy

  def index?
    participant && participant.admin? || participant && @record.id == participant.organizer_id
  end

  def show?
    false
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def new?
    false
  end

  def create?
    false
  end

  def destroy?
    index?
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
        if participant && participant.organizer_id
          scope.where("id = ?", participant.organizer_id)
        else
          scope.none
        end
      end
    end
  end

end
