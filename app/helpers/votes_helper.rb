module VotesHelper
  def vote_link(votable)
    vote_id = participant_vote_id(votable)
    if vote_id.nil?
      upvote_link(votable)
    else
      downvote_link(votable, vote_id)
    end
  end

  def upvote_link(votable)
    link_to "#{awesome_icon_tag('star-o fa-2x')} #{votable.vote_count}".html_safe, eval(create_vote_path(votable)), method: :post, remote: true
  end

  def downvote_link(votable, vote_id)
    link_to "#{awesome_icon_tag('star fa-2x')} #{votable.vote_count}".html_safe, eval(destroy_vote_path(votable, vote_id)), method: :delete, remote: true
  end

  def participant_vote_id(votable)
    vote = votable.votes(participant_id: current_participant.id).first
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
