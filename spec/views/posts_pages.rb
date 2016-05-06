class TopicsPages
  include Capybara::DSL

  def index(challenge_id)
    visit challenge_topics_path(challenge_id)
    self
  end

  def new(challenge_id)
  end

  def edit(challenge_id,topic_id)
  end

  def create(challenge_id,topic_id,params)
    
  end

  def destroy(challenge_id,topic_id)
  end

end
