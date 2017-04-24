class Vote::Cell < Cell::Concept
  include Devise::Controllers::Helpers
  Devise::Controllers::Helpers.define_helpers(Devise::Mapping.new(:participant, {}))

  def show
    render
  end

  def votable
    model
  end

  def classes
    classes = ['fa', 'fa-heart']
    classes << 'active' if participant_voted?
    classes.join(' ')
  end


  def create_vote_path
    classname = votable.class.to_s
    "#{classname.downcase}_votes_path(#{votable.id})"
  end

  def participant_voted?
    return false if current_participant.nil?
    vote = votable.votes.where(participant_id: current_participant.id).first
    return false if vote.nil?
    return true
  end



end
