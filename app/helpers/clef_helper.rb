module ClefHelper

  def current_participant_registered?
    return false unless current_participant.present?
    participant_clef_task = ParticipantClefTask.where(
      participant_id: current_participant).first
    if participant_clef_task
      return true if participant_clef_task.registered?
    else
      return false
    end
  end

end
