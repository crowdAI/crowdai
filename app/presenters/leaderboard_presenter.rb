class LeaderboardPresenter

  def initialize(challenge:,round:,view_context:)
    @challenge = challenge
    @round = round
    @view_context = view_context
  end

  def h
    @view
  end

  def post_challenge
    false
  end

  def top_rows
    @top_rows ||= @round.ranking_highlight
  end

  def leader_class(row)
    if row.row_num <= top_rows
      return 'leader'
    end
  end

  def cols
    @cols ||= begin
      cols = [:rank, :participant]
      cols << :media if @challenge.media_on_leaderboard
      cols << :score
      cols << :score_secondary unless @challenge.secondary_sort_order == :not_used
      cols << :entries
      cols << :post_challenge if post_challenge
      cols << :updated_at
    end
  end

  def ranking_change(entry)
    if entry.previous_row_num == 0 || entry.previous_row_num == entry.row_num
      return @view_context.image_tag(
        "icon-change-none.svg",
        data: { toggle: 'tooltip'},
        title: 'No change')
    end

    if entry.row_num > entry.previous_row_num
      return image_tag(
        "icon-change-down.svg",
        data: { toggle: 'tooltip'},
        title: "-#{entry.row_num - entry.previous_row_num} change, previous rank #{entry.previous_row_num}")
    end

    if entry.row_num < entry.previous_row_num && entry.previous_row_num != 0
      return image_tag(
        "icon-change-up.svg",
        data: { toggle: 'tooltip'},
        title: "+#{entry.previous_row_num - entry.row_num} change, previous rank #{entry.previous_row_num}")
    end
  end

=begin
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
=end

end
