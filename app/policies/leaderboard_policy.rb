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

end
