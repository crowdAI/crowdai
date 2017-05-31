class Discussion::Cell::TopicLikesListDetail < Template::Cell
  inherit_views Discussion::Cell
  
  def show
    render :topic_likes_list_detail
  end

  def topic
    model
  end

  def display_vote_count
    " #{topic.vote_count}".html_safe
  end

  def participant_voted?
    return false if current_participant.nil?
    vote = topic.votes.where(participant_id: current_participant.id).first
    return true if vote.present?
    return false
  end

  def classes
    classes = ['fa', 'fa-heart']
    classes << 'active' if participant_voted?
    return classes.join(' ')
  end

end
