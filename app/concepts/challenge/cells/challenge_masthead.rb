class Challenge::Cell::ChallengeMasthead < Cell::Concept
  inherit_views Challenge::Cell

  def show
    render :challenge_masthead
  end

  private
  def challenge
    model
  end

  def organizer
    model.organizer
  end

  def progress
    60
  end

end
