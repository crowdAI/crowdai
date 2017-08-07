class Follow::Cell < Template::Cell

  def show
    render
  end

  def followable
    model
  end

  def follow_link
    if current_participant.nil?
      sign_in_link
    else
      follow = followable.follows.where(participant_id: current_participant.id).first
      if follow.nil?
        upfollow_link
      else
        unfollow_link(follow)
      end
    end
  end

  def refresh
    #{}%{ console.log("#{j(show)}")}
    %{ $('##{follow_link_id}').replaceWith("#{j(show)}"); }
  end

  def participant_followed?
    return false if current_participant.nil?
    follow = followable.follows.where(participant_id: current_participant.id).first
    return true if follow.present?
    return false
  end

  def upfollow_link
    link_to "FOLLOW".html_safe,
            eval(create_follow_path),
            id: follow_link_id,
            class: 'btn btn-secondary',
            method: :post,
            remote: true
  end

  def follow_link_id
    "follow-link-#{model.class.to_s.downcase}-#{model.id}"
  end

  def create_follow_path
    classname = followable.class.to_s
    "#{classname.downcase}_follows_path(#{followable.id})"
  end

  def destroy_follow_path(followable, follow_id)
    classname = followable.class.to_s
    "#{classname.downcase}_follow_path(#{followable.id},#{follow_id})"
  end

  def unfollow_link(follow)
    link_to "UNFOLLOW".html_safe,
            eval(destroy_follow_path(followable, follow.id)),
            id: follow_link_id,
            class: 'btn btn-secondary',
            method: :delete,
            remote: true
  end

  def sign_in_link
    link_to "FOLLOW".html_safe,
            new_participant_session_path,
            id: follow_link_id,
            class: 'btn btn-secondary'
  end

end
