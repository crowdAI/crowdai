class TopicsPages
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def index(challenge_id)
    visit challenge_topics_path(challenge_id)
    self
  end

  def new(challenge_id)
  end


  def edit(challenge_id,topic_id)
  end

  def destroy(challenge_id,topic_id)
  end

end
