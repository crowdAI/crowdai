class SubmissionPolicy < ApplicationPolicy

  def index?
    participant
  end

  def show?
    @record.challenge.submissions_page.present? #&&   SubmissionPolicy::Scope.new(participant,Submission).resolve.include?(@record)
  end

  def new?
    ChallengePolicy.new(participant, @record.challenge).submissions_allowed?
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

  class Scope
    attr_reader :participant, :scope

    def initialize(participant, scope)
      @participant = participant
      @scope = scope
    end

    def participant_sql(participant)
      %Q[
        participant_id = #{participant.id}
        OR challenge_id IN
          (SELECT c.id
            FROM challenges c
            WHERE c.status_cd = 'completed'
            AND c.private_challenge IS FALSE
           UNION
           SELECT c.id
            FROM challenges c
            WHERE c.show_leaderboard IS TRUE
            AND c.private_challenge IS TRUE
            AND EXISTS (SELECT 'X'
              FROM invitations
              WHERE invitations.challenge_id = c.id
              AND invitations.email = '#{participant.email}'
            )
          )
        ]
    end

    def resolve
      if participant.blank?
        return Submission.where
      end
      if participant && participant.admin?
        scope.all
      else
        if participant && participant.organizer_id
          scope.where("challenge_id IN (SELECT c.id FROM challenges c WHERE c.organizer_id = ?",participant.organizer_id)
        elsif participant
          scope.where(participant_sql(participant))
        end
      end
    end

  end

end
