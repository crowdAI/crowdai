module VotesHelper
  def vote_link(votable)
    if current_participant
      vote_id = participant_vote_id(votable) if current_participant
      if vote_id.nil?
        upvote_link(votable)
      else
        downvote_link(votable, vote_id)
      end
    else
      guest_link(votable)
    end
  end


  def guest_link(votable)
    link_to "#{awesome_icon_tag('star-o fa-2x')} #{votable.vote_count}".html_safe, new_participant_session_path, id: "vote-link-#{votable.id}"
  end

  def upvote_link(votable)
    link_to "#{awesome_icon_tag('star-o fa-2x')} #{votable.vote_count}".html_safe, eval(create_vote_path(votable)), method: :post, remote: true, id: "vote-link-#{votable.id}"
  end

  def downvote_link(votable, vote_id)
    link_to "#{awesome_icon_tag('star fa-2x')} #{votable.vote_count}".html_safe, eval(destroy_vote_path(votable, vote_id)), method: :delete, remote: true, id: "vote-link-#{votable.id}"
  end

  def participant_vote_id(votable)
    vote = votable.votes.where(participant_id: current_participant.id).first
    return nil if vote.nil?
    vote.id
  end

  def create_vote_path(votable)
    classname = votable.class.to_s
    "#{classname.downcase}_votes_path(#{votable.id})"
  end

  def destroy_vote_path(votable, vote_id)
    classname = votable.class.to_s
    "#{classname.downcase}_vote_path(#{votable.id},#{vote_id})"
  end
end
