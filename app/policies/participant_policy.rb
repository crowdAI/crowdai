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
    participant
  end

  def regen_api_key?
    update?
  end

  def remove_image?
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
        if participant && participant.id
          scope.where("id = ?", participant.id)
        else
          scope.none
        end
      end
    end
  end

end
