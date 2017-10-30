class Challenge::Cell::ChallengeMasthead < Challenge::Cell

  def show
    render :challenge_masthead
  end

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
      "Ending"
    else
      nil
    end
  end

  def remaining_text
    if challenge.running?
      if remaining_time_in_days > 0
        "#{pluralize(remaining_time_in_days,'day')} left"
      elsif remaining_time_in_hours > 0
        "#{pluralize(remaining_time_in_hours,'hour')} left (#{ending_time})"
      elsif remaining_time_in_seconds > 0
        ending_time
      end
    else
      challenge.status.capitalize
    end
  end

end
