class LeaderboardPolicy < ApplicationPolicy

  def index?
    true
  end

  def host?
    true
  end

  #def submission_detail?
  #  participant && (participant.admin? || @record.organizer_id == participant.organizer_id || @record.participant_id == participant.id)
  #end

  def submission_detail?
    participant && (participant.admin? || @record.participant_id == participant.id)
  end


end
