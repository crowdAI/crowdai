class Participant::Cell < Cell::Concept

  def show
    render
  end

  def participant
    model
  end
end
