class Participant::Cell::ParticipantBio < Template::Cell
  inherit_views Participant::Cell

  def show
    render :participant_bio
  end

  def participant
    model
  end

end
