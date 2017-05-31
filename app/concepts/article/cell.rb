class Article::Cell < Cell::Concept

  def show
    render
  end

  private
  def article_section
    options[:article_section]
  end
end
