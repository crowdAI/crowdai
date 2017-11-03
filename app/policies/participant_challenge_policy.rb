class ParticipantChallengePolicy < ApplicationPolicy

  def index?
    record.first &&  ChallengePolicy.new(participant, record.first).participants_list_access?
  end


end
