class Article::Cell::ListDetail < Cell::Concept
  inherit_views Article::Cell

  def show
    render :list_detail
  end

  def author
    model.participant
  end

  private
  def article
    model
  end

end
