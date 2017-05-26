class ChallengePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    participant && (participant.admin? || @record.organizer_id == participant.organizer_id)
  end

  def update?
    edit?
  end

  def new?
    edit?
  end

  def create?
    new?
  end

  def destroy?
    edit?
  end

  def regrade?
    edit?
  end

  def load_more?
    index?
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
