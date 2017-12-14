class DatasetFilePolicy < ApplicationPolicy

  def index?
    participant
  end

  def new?
    participant && (participant.admin? || @record.challenge.organizer_id == participant.organizer_id)
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
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
      if participant && (participant.admin? || participant.organizer_id.present?)
        scope.all
      else
        scope.where("visible is true and evaluation is false")
      end
    end
  end

end
