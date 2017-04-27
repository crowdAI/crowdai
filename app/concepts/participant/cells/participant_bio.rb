class Participant::Cell::ParticipantBio < Cell::Concept
  inherit_views Participant::Cell

  def show
    render :participant_bio
  end

  def participant
    model
  end

end
