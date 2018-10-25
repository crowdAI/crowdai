module ChallengesHelper

  def participant_invitation(email:)
    participant = Participant.find_by(email: email)
    if participant.is_a?(NullParticipant)
      return 'No crowdAI account'
    else
      return link_to participant.name, participant_path(participant)
    end
  end

  def status_dropdown_helper(builder:)
    challenge = builder.object
    statuses = Challenge.statuses.hash
    if challenge.challenge_rounds.none? || challenge.dataset_files.none?
      statuses = statuses.except(:running,:completed,:terminated)
    end
    return builder.select :status, statuses.map {|k,v| [v.humanize,k]}, include_blank: false
  end

end
