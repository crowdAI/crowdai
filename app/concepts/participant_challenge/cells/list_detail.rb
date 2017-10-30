class ParticipantChallenge::Cell::ListDetail < Template::Cell
  inherit_views ParticipantChallenge::Cell

  def show
    render :list_detail
  end

  def participant_challenge
    model
  end

  def challenge
   @challenge ||= Challenge.find(participant_challenge.challenge_id)
  end

end
