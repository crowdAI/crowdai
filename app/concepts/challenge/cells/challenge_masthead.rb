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

end
