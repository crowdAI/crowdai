class EmailPreferencePolicy < ApplicationPolicy

  def edit?
    participant && (participant.admin? || @record.participant == participant)
  end

  def update?
    edit?
  end

end
