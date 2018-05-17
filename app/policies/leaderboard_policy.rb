class LeaderboardPolicy < ApplicationPolicy

  def index?
    true
  end

  def host?
    true
  end

  def submission_detail?
    participant &&
      (participant.admin? ||
        @record.participant_id == participant.id ||
        ChallengeOrganizerParticipant.where(
          participant_id: participant.id,
          id: @record.challenge_id
        ).present?
      )
  end

  class Scope
    attr_reader :participant, :scope

    def initialize(participant, scope)
      @participant = participant
      @scope = scope
    end

    def participant_sql(participant)
      if participant.present?
        participant_id = participant.id
        email = participant.email
      else
        participant_id = 0
        email = nil
      end
      %Q[
        participant_id = #{participant_id}
        OR leaderboards.challenge_id IN
          (SELECT c.id
            FROM challenges c
            WHERE c.show_leaderboard IS TRUE
            AND c.private_challenge IS FALSE
          UNION
           SELECT c.id
            FROM challenges c
            WHERE c.show_leaderboard IS TRUE
            AND c.private_challenge IS TRUE
            AND EXISTS (SELECT 'X'
              FROM invitations
              WHERE invitations.challenge_id = c.id
              AND invitations.email = '#{email}'
            )
          )
        ]
    end

    def resolve
      if participant && participant.admin?
        scope.all
      else
        if participant && participant.organizer_id
          sql = %Q[
            #{participant_sql(participant)}
            OR challenge_id IN
              (SELECT c.id
                FROM challenges c
                WHERE c.organizer_id = #{participant.organizer_id})
          ]
          scope.where(sql)
        else
          scope.where(participant_sql(participant))
        end
      end
    end
  end

end
