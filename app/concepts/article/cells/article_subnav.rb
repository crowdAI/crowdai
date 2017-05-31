class Article::Cell::ArticleSubnav < Template::Cell
  inherit_views Article::Cell

  def show
    render :article_subnav
  end

  private
  def article
    model
  end

  def article_section
    options[:article_section]
  end

end
