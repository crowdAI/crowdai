class Leaderboard::Cell::LeaderboardSubnav < Leaderboard::Cell

  def show
    render :leaderboard_subnav
  end

  def challenge
    model
  end

  def current_round
    options[:current_round]
  end

  def challenge_rounds
    challenge.stages.where(leaderboard_visible: true).order(seq: :desc)
  end

  def tab_class(challenge_round)
    if challenge_round.id == current_round.id
      return 'active'
    else
      return ''
    end
  end

end
