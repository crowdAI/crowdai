class Participant::Cell::ParticipantChallengesList < Template::Cell
  inherit_views Participant::Cell

  def show
    render :participant_challenges_list
  end

  def challenges
    model
  end

end
