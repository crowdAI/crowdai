class ArticlePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    participant && (participant.admin? || @record.participant == participant)
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
        if participant
          scope.where("published = true or (published = false and participant_id = ?)", participant.id)
        else
          scope.where(published: true)
        end
      end
    end
  end

end
