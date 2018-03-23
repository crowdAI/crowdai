module LeaderboardHelper

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
