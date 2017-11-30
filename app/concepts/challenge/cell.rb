class Challenge::Cell < Template::Cell

  def show
    render
  end

  def current_challenge_round
    @current_challenge_round ||= challenge.challenge_round_summaries.where(round_status_cd: 'current').first
  end

  def ending_dttm
    return nil if current_challenge_round.nil?
    current_challenge_round.end_dttm.strftime("%d %b %H:%M UTC")
  end

  def ending_time
    return nil if current_challenge_round.nil?
    current_challenge_round.end_dttm.strftime("%H:%M UTC")
  end

  def duration_in_seconds
    return nil if current_challenge_round.nil?
    current_challenge_round.end_dttm - current_challenge_round.start_dttm
  end

  def remaining_time_in_seconds
    return 0 if current_challenge_round.nil? || current_challenge_round.end_dttm.nil?
    seconds = current_challenge_round.end_dttm - Time.now
    if seconds.nil? || seconds < 0
      seconds = 0
    end
    return seconds
  end

  def remaining_time_in_hours
    (remaining_time_in_seconds / (60 * 60)).floor
  end

  def remaining_time_in_days
    (remaining_time_in_seconds / (60 * 60 * 24)).floor
  end

  def pct_remaining
    if remaining_time_in_seconds > 0 && duration_in_seconds > 0
      ((remaining_time_in_seconds / duration_in_seconds) * 100).floor
    else
      0
    end
  end

end
