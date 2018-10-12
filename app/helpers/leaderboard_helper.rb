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

  def ranking_change_helper(entry)
    if entry.previous_row_num == 0 || entry.previous_row_num == entry.row_num
      output =  "<td class='change'>" +
                    image_tag(
                      "icon-change-none.csv",
                      data: { toggle: 'tooltip'},
                      title: '0 change') +
                "</td>"
      return output
    end

    if entry.row_num > entry.previous_row_num
      output =  "<td class='change'>" +
                    image_tag(
                      "icon-change-up.csv",
                      data: { toggle: 'tooltip'},
                      title: "+#{entry.row_num - entry.previous_row_num} change") +
                "</td>"
      return output
    end

    if entry.row_num < entry.previous_row_num && entry.previous_row_num != 0
      output =  "<td class='change'>" +
                    image_tag(
                      "icon-change-down.csv",
                      data: { toggle: 'tooltip'},
                      title: "-#{entry.previous_row_num - entry.row_num} change") +
                "</td>"
      return output
    end
  end

end
