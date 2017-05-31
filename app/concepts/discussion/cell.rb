class Discussion::Cell < Template::Cell

  def show
    render
  end

  def topic
    model
  end

  def comments
    @comments ||= topic.comments
  end

  def author
    @author ||= topic.participant
  end

end
