module LeaderboardHelper

  def status_badge(status)
    case status
    when 'ready','submitted','initialized'
      klass = 'badge-amber'
    when 'graded'
      klass = 'badge-green'
    when 'failed'
      klass = 'badge-red'
    else
      klass = 'badge-amber'
    end

    %Q[
      <div class="#{klass}">
        <span class="badge-square"></span>
        <span class="badge-text">
          #{status.capitalize}
        </span>
      </div>
    ].html_safe
  end

end
