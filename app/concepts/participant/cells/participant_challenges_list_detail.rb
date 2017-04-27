class Participant::Cell::ParticipantChallengesListDetail < Cell::Concept
  inherit_views Participant::Cell

  def show
    render :participant_challenges_list_detail
  end

  def challenge
    model
  end

end
