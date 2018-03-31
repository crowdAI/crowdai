class ParticipantChallengePolicy < ApplicationPolicy

  def index?
    participant
  end

  class Scope
    attr_reader :participant, :scope

    def initialize(participant, scope)
      @participant = participant
      @scope = scope
    end

    def participant_sql(email:)
      %Q[
        participant_challenges.status_cd IN ('running','completed','starting_soon')
        AND participant_challenges.private_challenge IS FALSE
        OR (participant_challenges.private_challenge IS TRUE
            AND EXISTS (SELECT 'X'
                    FROM invitations
                    WHERE invitations.challenge_id = participant_challenges.id
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
          scope.where("status_cd IN ('running','completed','starting_soon') AND participant_challenges.private_challenge IS FALSE")
        end
      end
    end
  end

end
