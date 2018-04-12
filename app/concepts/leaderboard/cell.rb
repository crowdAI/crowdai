class Leaderboard::Cell < Template::Cell

  def challenge
    options[:challenge]
  end

  def submissions
    options[:submissions]
  end

  def post_challenge
    options[:post_challenge]
  end

  def cols
    cols = [:rank, :participant]
    cols << :media if challenge.media_on_leaderboard
    cols << :score
    cols << :score_secondary unless challenge.secondary_sort_order == :not_used
    cols << :entries
    cols << :post_challenge if post_challenge
    cols << :updated_at
    return cols
  end

  def insert_submissions
    submission = submissions.first
    participant_id = submission.participant_id
    challenge_id = submission.challenge_id
    #%{ console.log("#{j(submission_rows)}"); }
    %{
      $("#{j(submission_rows)}").insertAfter("#participant-#{participant_id}");
      $("#participant-link-#{participant_id}").replaceWith("#{j(hide_submissions_link(participant_id,challenge_id))}");
    }
  end

  def submission_rows
    render :submission_rows
  end

  def hide_submissions_link(participant_id,challenge_id)
    link_to 'close', challenge_leaderboards_path(challenge_id), id: "participant-link-#{ participant_id }"
  end

  def ranking_change(entry)
    if entry.previous_row_num == 0 || entry.previous_row_num == entry.row_num
      return image_tag(
        "icon-change-none.svg",
        data: { toggle: 'tooltip'},
        title: '0 change')
    end

    if entry.row_num > entry.previous_row_num
      return image_tag(
        "icon-change-up.svg",
        data: { toggle: 'tooltip'},
        title: "+#{entry.row_num - entry.previous_row_num} change")
    end

    if entry.row_num < entry.previous_row_num && entry.previous_row_num != 0
      return image_tag(
        "icon-change-down.svg",
        data: { toggle: 'tooltip'},
        title: "-#{entry.previous_row_num - entry.row_num} change")
    end
  end

  def organizer_badge?(challenge_id:,participant_id:)
    challenge = Challenge.find(challenge_id)
    participant = Participant.find(participant_id)
    return true if challenge.organizer_id == participant.organizer_id
  end

end
