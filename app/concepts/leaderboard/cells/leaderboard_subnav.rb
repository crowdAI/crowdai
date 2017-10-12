class Leaderboard::Cell::LeaderboardSubnav < Leaderboard::Cell

  def show
    if challenge_rounds.count > 1
      render :leaderboard_subnav
    else
      nil
    end
  end

  def challenge
    model
  end

  def current_round
    options[:current_round]
  end

  def challenge_rounds
    challenge.challenge_rounds.where(leaderboard_visible: true).order(seq: :desc)
  end

  def tab_class(challenge_round)
    if challenge_round.id == current_round.id
      return 'active'
    else
      return ''
    end
  end

end
