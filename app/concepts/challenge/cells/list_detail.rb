class Challenge::Cell::ListDetail < Template::Cell
  inherit_views Challenge::Cell

  def show
    render :list_detail
  end

  def challenge
    model
  end

  def end_dttm
    d = challenge.end_date
    t = challenge.end_time
    dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec)
  end

  def remaining_time_in_seconds
    seconds = end_dttm - Time.now
    if seconds.nil? || seconds < 0
      seconds = 0
    end
    return seconds
  end

  def remaining_text
    if challenge.running?
      if remaining_time_in_days > 0
        "#{remaining_time_in_days} days left"
      else
        "#{remaining_time_in_hours} hours left"
      end
    else
      "Challenge ended"
    end
  end

  def remaining_time_in_hours
    (remaining_time_in_seconds / (60 * 60)).floor
  end

  def remaining_time_in_days
    (remaining_time_in_seconds / (60 * 60 * 24)).floor
  end

end
