class Discussion::Cell::TopicAdmin < Discussion::Cell

  def show
    admin_actions
  end

  def challenge
    @challenge ||= topic.challenge
  end

  def admin_actions
    if current_participant && current_participant.admin?
      " | #{link_to 'Edit', edit_challenge_topic_path(challenge,topic)} | #{link_to 'Delete', challenge_topic_path(challenge,topic), method: :delete}"
    end
  end

end
