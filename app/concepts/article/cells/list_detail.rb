class Article::Cell::ListDetail < Template::Cell
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
