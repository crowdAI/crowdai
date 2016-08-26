class OrganizerPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    participant && participant.admin? || participant && @record.organizer_id == participant.organizer_id
  end

  def edit?
    participant && participant.admin?
  end

  def update?
    edit?
  end

  def new?
    participant && participant.admin?
  end

  def create?
    new?
  end

  def destroy?
    new?
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
          scope.where("organizer_id = ?", participant.organizer_id)
        else
          scope.none
        end
      end
    end
  end

end
