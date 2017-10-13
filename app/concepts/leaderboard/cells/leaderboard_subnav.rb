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
    active_round = challenge.challenge_rounds.where(active: true).first
    challenge.challenge_rounds.where("start_dttm <= ?",active_round.start_dttm).order(start_dttm: :desc)
  end

  def tab_class(challenge_round)
    if challenge_round.id == current_round.id
      return 'active'
    else
      return ''
    end
  end

end
