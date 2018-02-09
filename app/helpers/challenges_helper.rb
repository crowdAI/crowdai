module ChallengesHelper

  def participant_invitation(email:)
    participant = Participant.find_by(email: email)
    if participant.is_a?(NullParticipant)
      return 'No crowdAI account'
    else
      return participant.name
    end
  end

end
