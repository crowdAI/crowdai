class ParticipantChallenge::Cell::ListDetail < ParticipantChallenge::Cell

  def show
    render :list_detail
  end

  def participant_challenge
    model
  end

  def participant
    @participant ||= participant_challenge.participant
  end

  def challenge
   @challenge ||= Challenge.find(participant_challenge.challenge_id)
  end

end
