class Discussion::Cell::ListDetail < Discussion::Cell

  def show
    render :list_detail
  end

  def topic
    model
  end

  def challenge
    @challenge ||= topic.challenge
  end

  def author
    @author ||= topic.participant
  end

  def comments
    @comments ||= topic.comments
  end

  def last_comment
    @last_comment ||= comments.last
  end

  def comment_count
    @comment_count ||= comments.count -1
  end

  def last_comment_author
    return nil if last_comment.nil?
    last_comment.participant
  end

  def participant_link
    if topic.participant.is_a? NullParticipant
      link = "Posted by #{link_to author.name, '#'} "
    else
      link = "Posted by #{link_to author.name, participant_path(author) } "
    end
    return link
  end


end
