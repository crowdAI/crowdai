class Discussion::Cell < Cell::Concept

  def show
    render
  end

  def topics
    model
  end

  def challenge
    options[:challenge]
  end
  
end
