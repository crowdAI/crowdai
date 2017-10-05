class Article::Cell::ListDetail < Article::Cell

  def show
    render :list_detail
  end

  def article
    model
  end

  def author
    if model.participant.present?
      model.participant
    else
      NullParticipant.new
    end
  end

end
