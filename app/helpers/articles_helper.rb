module ArticlesHelper

  def version_link(article)
    if article.versions.any?
      html = <<-HTML
        <div class='pull-right'>
          #{pluralize(article.versions.count, ' previous version')}
        </div>
      HTML
    else
      html = <<-HTML
        <div class='pull-right'>No previous versions</div>
      HTML
    end
    html.html_safe
  end

end
