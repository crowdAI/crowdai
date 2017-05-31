class Discussion::Cell::CommentForm < Template::Cell
  inherit_views Discussion::Cell

  def show
    render :comment_form
  end

  def topic
    model
  end

  def comment
    topic.comments.new(participant: current_participant)
  end

end
