class Article::Cell::ArticleMasthead < Cell::Concept
  inherit_views Article::Cell

  def show
    render :article_masthead
  end

  private
  def article
    model
  end

  def author
    model.participant
  end

  def created_at
    article.created_at.strftime(Crowdai::DATE_FORMAT)
  end

end
