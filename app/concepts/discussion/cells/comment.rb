class Discussion::Cell::Comment < Template::Cell
  inherit_views Discussion::Cell

  def show
    render :comment
  end

  def comment
    model
  end

  def author
    return @author ||= Participant.find(comment.participant_id)
  end

end
