class Participant::Cell::ParticipantArticlesListDetail < Cell::Concept
  inherit_views Participant::Cell

  def show
    render :participant_articles_list_detail
  end

  def article
    model
  end

end
