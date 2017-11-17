class ParticipantChallengePolicy < ApplicationPolicy

  def index?
    participant
  end

end
