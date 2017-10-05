class Article::Cell < Template::Cell

  def show
    render
  end

  private
  def article_section
    options[:article_section]
  end
end
