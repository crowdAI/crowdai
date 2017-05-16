class Organizer::Cell < Template::Cell

  def show
    render
  end

  def organizer
    model
  end
end
