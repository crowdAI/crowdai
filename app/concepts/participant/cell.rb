class Participant::Cell < Template::Cell

  def show
    render
  end

  def participant
    model
  end

end
