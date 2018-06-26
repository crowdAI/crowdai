class SubmissionPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    challenge = @record.challenge
    if challenge.show_leaderboard.present? && challenge.submissions_page.present? && challenge.private_challenge.blank?
      return true
    end
    @record.challenge.submissions_page.present? && (
      (participant && (participant.admin? ||
        @record.challenge.organizer_id == participant.organizer_id )) ||
      (@record.challenge.submissions_page.present? && @record.challenge.show_leaderboard.present? &&
        SubmissionPolicy::Scope
          .new(participant,Submission)
          .resolve
          .include?(@record))
    )
  end

  def new?
    ChallengePolicy
      .new(participant, @record.challenge)
      .submissions_allowed?
  end

  def create?
    new?
  end

  def edit?
    participant && (participant.admin? ||
      @record.challenge.organizer_id == participant.organizer_id )
  end

  def update?
    edit?
  end

  def destroy?
    edit?
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
        OR submissions.challenge_id IN
          (SELECT c.id
            FROM challenges c
            WHERE c.show_leaderboard IS TRUE
            AND c.private_challenge IS FALSE
          UNION
           SELECT c.id
            FROM challenges c
            WHERE c.show_leaderboard IS TRUE
            AND c.private_challenge IS TRUE
            AND c.status_cd = 'completed'
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
