class Participant::Cell::ParticipantArticlesList < Template::Cell
  inherit_views Participant::Cell

  def show
    render :participant_articles_list
  end

  def articles
    model
  end

end
