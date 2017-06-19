class Vote::Cell < Template::Cell

  def show
    render
  end

  def votable
    model
  end

  def vote_link
    if current_participant.nil?
      sign_in_link
    else
      if participant_voted?
        disabled_vote_link
      else
        upvote_link
      end
    end
  end

  def refresh
    Rails.logger.debug "refreshing: #{votable.id}"
    #{}%{ console.log("#{j(show)}")}
    %{ $('##{vote_link_id}').replaceWith("#{j(show)}"); }
  end

  def participant_voted?
    return false if current_participant.nil?
    vote = votable.votes.where(participant_id: current_participant.id).first
    return true if vote.present?
    return false
  end

  def display_vote_count
    return nil if votable.vote_count == 0
    " #{votable.vote_count}".html_safe
  end

  def upvote_link
    link_to "<i class='fa fa-heart' aria-hidden='true'></i> #{display_vote_count}".html_safe,
            eval(create_vote_path),
            id: vote_link_id,
            class: 'btn btn-secondary',
            method: :post,
            remote: true
  end

  def vote_link_id
    "vote-link-#{model.class.to_s.downcase}-#{model.id}"
  end

  def create_vote_path
    classname = votable.class.to_s
    "#{classname.downcase}_votes_path(#{votable.id})"
  end

  def disabled_vote_link
    link_to "<i class='fa fa-heart active' aria-hidden='true'></i> #{display_vote_count}".html_safe,
            '#',
            id: vote_link_id,
            class: 'btn btn-secondary'
  end

  def sign_in_link
    link_to "<i class='fa fa-heart' aria-hidden='true'></i> #{display_vote_count}".html_safe,
            new_participant_session_path,
            id: vote_link_id,
            class: 'btn btn-secondary'
  end

end
