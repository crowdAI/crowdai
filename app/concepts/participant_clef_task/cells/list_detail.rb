class ParticipantClefTask::Cell::ListDetail < ParticipantClefTask::Cell

  def show
    render :list_detail
  end

  def participant_clef_task
    model
  end

  def clef_task
    @clef_task ||= participant_clef_task.clef_task
  end

  def challenge_id
    @challenge_id ||= options[:challenge_id]
  end

  def participant
    @participant ||= participant_clef_task.participant
  end

  def clef_status
    case participant_clef_task.status_cd
    when 'requested'
      "<h5>EAU Downloaded</h5>"
    when 'submitted'
      "#{ link_to 'Approve', participant_clef_task_path(clef_task,participant_id: participant.id,challenge_id: challenge_id), method: :patch, remote: true, class: 'btn btn-small btn-primary' }"
    when 'registered'
      "<h5>Approved</h5>"
    when 'rejected'
      "<h5>Rejected</h5>"
    end
  end

end
