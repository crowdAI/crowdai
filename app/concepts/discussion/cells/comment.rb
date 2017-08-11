class Discussion::Cell::Comment < Template::Cell
  inherit_views Discussion::Cell

  def show
    render :comment
  end

  def comment
    model
  end

  def topic
    @topic ||= comment.topic
  end

  def author
    return @author ||= Participant.find(comment.participant_id)
  end

  def admin_actions
    if current_participant && current_participant.admin?
      " | #{link_to 'Edit', edit_topic_comment_path(topic,comment), remote: true} | #{link_to 'Delete', topic_comment_path(topic,comment), method: :delete}"
    end
  end

end
