class Discussion::Cell < Cell::Concept
  include ActionView::Helpers::DateHelper

  def show
    render
  end

  def topic
    model
  end

  def comments
    @comments ||= topic.comments
  end

  def author
    @author ||= topic.participant
  end

end
