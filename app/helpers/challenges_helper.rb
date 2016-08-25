module ChallengesHelper

  def version_link(challenge)
    if challenge.versions.any?
      html = <<-HTML
        <div class='pull-right'>
          #{pluralize(challenge.versions.count, ' previous version')}
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
