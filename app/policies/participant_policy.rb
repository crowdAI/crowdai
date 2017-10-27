class ParticipantPolicy < ApplicationPolicy

  def index?
    false
  end

  def show?
    true
  end

  def edit?
    participant && participant.admin? || participant && @record.id == participant.id
  end

  def update?
    edit?
  end

  def new?
    false
  end

  def create?
    false
  end

  def destroy?
    edit?
  end

  def regen_api_key?
    edit?
  end

  def remove_image?
    edit?
  end

  def clef_access?
    participant && (participant.admin? || participant.id == @record.id || participant.organizer && participant.organizer.clef_organizer == true)
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
        if participant && participant.id
          scope.where("id = ?", participant.id)
        else
          scope.none
        end
      end
    end
  end

end
