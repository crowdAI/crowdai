class FollowPolicy < ApplicationPolicy

  def create?
    participant
  end

end
