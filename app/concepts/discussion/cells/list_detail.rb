class Discussion::Cell::ListDetail < Cell::Concept
  inherit_views Discussion::Cell

  def show
    render :list_detail
  end

  def topic
    model
  end

  def author
    topic.participant
  end

end
