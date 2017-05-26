class OrganizerPolicy < ApplicationPolicy

  def index?
    false
  end

  def show?
    true
  end

  def edit?
    participant && participant.admin? || participant && @record.id == participant.organizer_id
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

  def regen_api_key?
    update?
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
