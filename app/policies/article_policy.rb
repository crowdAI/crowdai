class ArticlePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    @record.published || edit?
  end

  def edit?
    participant && (participant.admin? || @record.participant == participant)
  end

  def update?
    edit?
  end

  def new?
    participant
  end

  def create?
    new?
  end

  def destroy?
    edit?
  end

  def remove_image?
    edit?
  end

  def activate?
    participant && participant.admin?
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
          scope.where("published = true OR (published = false and participant_id = ?)", participant.id)
        else
          scope.where(published: true)
        end
      end
    end
  end

end
