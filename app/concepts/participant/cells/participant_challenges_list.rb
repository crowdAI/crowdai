class Participant::Cell::ParticipantChallengesList < Cell::Concept
  inherit_views Participant::Cell

  def show
    render :participant_challenges_list
  end

  def challenges
    model
  end

end
