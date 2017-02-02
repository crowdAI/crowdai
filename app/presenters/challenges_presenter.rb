class ChallengesPresenter < SimpleDelegator

  def start_date
    start_dttm.strftime("%a %-d %b %Y")
  end

  def end_date
    end_dttm.strftime("%a %-d %b %Y")
  end

  def start_day
    start_dttm.strftime("%-d")
  end

  def end_day
    end_dttm.strftime("%-d")
  end

  def start_month
    start_dttm.strftime("%^b")
  end

  def end_month
    end_dttm.strftime("%^b")
  end


  def remaining_text
    if running?
      if remaining_time_in_days > 0
        "#{remaining_time_in_days} days remaining"
      else
        "#{remaining_time_in_hours} hours remaining"
      end
    else
      status
    end
  end

  def duration_in_seconds
    end_dttm - start_dttm
  end

  def remaining_time_in_seconds
    seconds = end_dttm - Time.now
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

  def pct_passed
    100 - pct_remaining
  end

  def pct_remaining
    if remaining_time_in_seconds > 0 && duration_in_seconds > 0
      ((remaining_time_in_seconds / duration_in_seconds) * 100).floor
    else
      0
    end
  end

end
