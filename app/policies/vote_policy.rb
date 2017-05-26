class VotePolicy < ApplicationPolicy

  def create?
    participant
  end
  
end
