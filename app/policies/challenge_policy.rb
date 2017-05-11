class ChallengePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    @record.running? || @record.completed? || @record.starting_soon? || participant && participant.admin? || participant && @record.organizer_id == participant.organizer_id
  end

  def edit?
    participant && (participant.admin? || @record.organizer_id == participant.organizer_id)
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

  def regrade?
    edit?
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
          scope.where("status_cd IN ('running','completed','starting_soon') OR organizer_id = ?", participant.organizer_id)
        else
          scope.where("status_cd IN ('running','completed','starting_soon')")
        end
      end
    end
  end

end
