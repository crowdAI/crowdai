class Organizer::Cell < Template::Cell

  def show
    render
  end

  def organizer
    model
  end

  def challenges
    @challenges ||= organizer.challenges
  end

  def members
    @members ||= organizer.participants
  end

  def challenges_tab
    render :challenges_tab
  end

  def members_tab
    render :members_tab
  end

end
