class Leaderboard::Cell < Template::Cell

  def show
    render
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

  def table_head
    render
  end

  def table_body
    render
  end

  def participant(id)
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

end
