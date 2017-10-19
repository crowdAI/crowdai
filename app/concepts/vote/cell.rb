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
      vote = votable.votes.where(participant_id: current_participant.id).first
      if vote.nil?
        upvote_link
      else
        unvote_link(vote)
        # disabled_vote_link
      end
    end
  end

  def refresh
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
    "vote-link-#{votable.model_name.param_key}-#{model.id}"
  end

  def create_vote_path
    x = "#{votable.model_name.param_key}_votes_path(#{votable.id})"
    Rails.logger.debug("PATH: #{x}")
    return x
  end

  def destroy_vote_path(votable, vote_id)
    "#{votable.model_name.param_key}_vote_path(#{votable.id},#{vote_id})"
  end

  def disabled_vote_link
    link_to "<i class='fa fa-heart active' aria-hidden='true'></i> #{display_vote_count}".html_safe,
            '#',
            id: vote_link_id,
            class: 'btn btn-secondary'
  end

  def unvote_link(vote)
    link_to "<i class='fa fa-heart active' aria-hidden='true'></i> #{display_vote_count}".html_safe,
            eval(destroy_vote_path(votable, vote.id)),
            id: vote_link_id,
            class: 'btn btn-secondary',
            method: :delete,
            remote: true
  end

  def sign_in_link
    link_to "<i class='fa fa-heart' aria-hidden='true'></i> #{display_vote_count}".html_safe,
            new_participant_session_path,
            id: vote_link_id,
            class: 'btn btn-secondary'
  end

end
