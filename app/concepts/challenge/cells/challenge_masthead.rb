class Challenge::Cell::ChallengeMasthead < Template::Cell
  inherit_views Challenge::Cell

  def show
    render :challenge_masthead
  end

  private
  def challenge
    model
  end

  def organizer
    model.organizer
  end

  def progress
    100 - pct_remaining
  end

  def remaining_units
    if challenge.running?
      if remaining_time_in_days > 0
        remaining_time_in_days
      elsif remaining_time_in_hours > 0
        "Ending #{ending_dttm}"        
      else
        nil
      end
    end
  end

  def remaining_text
    if challenge.running?
      if remaining_time_in_days > 0
        "#{'Day'.pluralize(remaining_time_in_days)} left"
      elsif remaining_time_in_hours > 0
        "#{pluralize(remaining_time_in_hours,'hour')} left"
      elsif remaining_time_in_seconds > 0
        "Less than 1 hour left"
      end
    else
      challenge.status.capitalize
    end
  end

  def ending_dttm
    challenge.end_dttm
  end

  def duration_in_seconds
    challenge.end_dttm - challenge.start_dttm
  end

  def remaining_time_in_seconds
    seconds = challenge.end_dttm - Time.now
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
