class ParticipantChallenge::Cell::ListDetail < ParticipantChallenge::Cell

  def show
    render :list_detail
  end

  def participant_challenge
    model
  end

  def challenge
   @challenge ||= Challenge.find(participant_challenge.challenge_id)
  end

  def clef_status
    return nil if challenge.organizer.clef_organizer == false
    challenge_registration = challenge.challenge_registrations.where(participant_id: current_participant.id).first
    return nil if challenge_registration.nil?
    case challenge_registration.status_cd
    when 'requested'
      "<h5>EAU Downloaded</h5>"
    when 'submitted'
      "#{ link_to 'Approve', approve_challenge_participant_challenges_path, class: 'btn btn-small btn-primary' }
       #{ link_to 'Deny', deny_challenge_participant_challenges_path, class: 'btn btn-small btn-secondary' }"
    when 'registered'
      "<h5>Approved</h5>"
    when 'rejected'
      "<h5>Rejected</h5>"
    end
  end

end
