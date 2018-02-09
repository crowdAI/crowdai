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

  def regen_api_key?
    update?
  end

  def remove_image?
    update?
  end

  def clef_task?
    update?
  end


  class Scope
    attr_reader :participant, :scope

    def initialize(participant, scope)
      @participant = participant
      @scope = scope
    end

    def participant_sql(email:)
      %Q[
        challenges.status_cd IN ('running','completed','starting_soon')
        AND challenges.private_challenge IS FALSE
        OR (challenges.private_challenge IS TRUE
            AND EXISTS (SELECT 'X'
                    FROM invitations
                    WHERE invitations.challenge_id = challenges.id
                    AND invitations.email = '#{email}'))
      ]
    end

    def resolve
      if participant && participant.admin?
        scope.all
      else
        if participant && participant.organizer_id
          scope.where("status_cd IN ('running','completed','starting_soon') OR organizer_id = ?", participant.organizer_id)
        elsif participant
          scope.where(participant_sql(email: participant.email))
        else
          scope.where("status_cd IN ('running','completed','starting_soon') AND challenges.private_challenge IS FALSE")
        end
      end
    end
  end

end
