class Discussion::Cell::CommentForm < Cell::Concept
  inherit_views Discussion::Cell
  include Devise::Controllers::Helpers
  Devise::Controllers::Helpers.define_helpers(Devise::Mapping.new(:participant, {}))

  def show
    render :comment_form
  end

  def topic
    model
  end

  def comment
    topic.comments.build(participant: current_participant)
  end

end
