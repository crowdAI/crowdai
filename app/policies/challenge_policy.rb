class ChallengePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    ChallengePolicy::Scope.new(participant,Challenge).resolve.include?(@record)
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

  def show_leaderboard?
    @record.challenge_rounds.present? &&
      @record.show_leaderboard == true ||
        (participant &&
          (participant.admin? || @record.organizer_id == participant.organizer_id))
  end

  def submissions_allowed?
    return false unless @record.online_submissions
    if participant && (participant.admin? || @record.organizer_id == participant.organizer_id)
      return true
    end
    if @record.running? || (@record.completed? && @record.post_challenge_submissions?)
      if @record.clef_challenge.present?
        if clef_participant_registered?(@record)
          return true #return true if running and clef challenge and registered
        else
          return false #return false if running and clef_challenge and NOT REGISTERED
        end
      else
        return true #return true if running and no clef challenge
      end
    end
    return false # no positive condition met
  end

  def clef_participant_registered?(challenge)
    return false unless participant.present?
    clef_task = challenge.clef_task
    participant_clef_task = ParticipantClefTask.where(
      participant_id: participant,
      clef_task_id: clef_task.id).first
    if participant_clef_task
      return true if participant_clef_task.registered?
    else
      return false
    end
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
