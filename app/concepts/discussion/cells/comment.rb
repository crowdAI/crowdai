class Discussion::Cell::Comment < Template::Cell
  inherit_views Discussion::Cell

  def show
    render :comment
  end

  def comment
    model
  end

  def author
    return @author ||= Participant.first
    # TODO fix this
    if comment.participant_id
      @author ||= Participant.find(comment.participant_id)
    else
      @author ||= Participant.first
    end
  end

end
