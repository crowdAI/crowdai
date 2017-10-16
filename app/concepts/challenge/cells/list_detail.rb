class Challenge::Cell::ListDetail < Challenge::Cell

  def show
    render :list_detail
  end

  def challenge
    model
  end

  def remaining_text
    case challenge.status
    when :running, :perpetual
      if remaining_time_in_days > 7
        "#{pluralize(remaining_time_in_days,'day')} left"
      elsif remaining_time_in_days <= 7 and remaining_time_in_days >= 1
        "#{pluralize(remaining_time_in_days,'day')} left &middot; Ending #{ending_dttm}"
      elsif remaining_time_in_hours > 0
        "#{pluralize(remaining_time_in_hours,'hour')} left &middot; Ending #{ending_dttm}"
      elsif remaining_time_in_seconds > 0
        "Less than 1 hour left &middot; Ending #{ending_dttm}"
      else
        "Challenge ended"   # display for perpetual challenges
      end
    when :draft
      "Draft"
    when :completed
      "Challenge ended"
    when :starting_soon
      "Starting soon"
    end
  end

end
