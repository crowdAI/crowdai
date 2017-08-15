class Leaderboard::Cell < Template::Cell
  include Kaminari::Cells

  def show
    render
  end

  def submission_rows
    render :submission_rows
  end

  def leaderboard
    model
  end

  def challenge
    options[:challenge]
  end

  def post_challenge
    options[:post_challenge]
  end

  def submissions
    options[:submissions]
  end

  def table_head
    render
  end

  def table_body
    render
  end

  def get_participant(id)
    Participant.find(id)
  end

  def submission(id)
    Submission.find(id)
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

  def hide_submissions_link(participant_id,challenge_id)
    link_to 'close', challenge_leaderboards_path(challenge_id), id: "participant-link-#{ participant_id }"
  end

end
