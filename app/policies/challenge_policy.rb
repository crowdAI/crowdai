class ChallengePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    @record.running? || @record.completed? || participant && participant.admin? || participant && @record.organizer_id == participant.organizer_id
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
          scope.where("status_cd IN ('running','completed') OR organizer_id = ?", participant.organizer_id)
        else
          scope.where("status_cd IN ('running','completed')")
        end
      end
    end
  end

end
