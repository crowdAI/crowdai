class Timeline

  attr_reader :events

  def initialize(challenge)
    @challenge = challenge
    @events = challenge.events
  end

  def start_date
    return nil if !self.valid?
    start_date_unformatted.strftime("%a %-d %b %Y")
  end

  def end_date
    return nil if !self.valid?
    end_date_unformatted.strftime("%a %-d %b %Y ")
  end

  def start_dttm
    return nil if !self.valid?
    start_date_unformatted.strftime("%a %-d %b %Y %z")
  end

  def end_dttm
    return nil if !self.valid?
    end_date_unformatted.strftime("%a %-d %b %Y %z")
  end

  def start_day
    return nil if !self.valid?
    start_date_unformatted.strftime("%-d")
  end

  def end_day
    return nil if !self.valid?
    end_date_unformatted.strftime("%-d")
  end

  def start_month
    return nil if !self.valid?
    start_date_unformatted.strftime("%^b")
  end

  def end_month
    return nil if !self.valid?
    end_date_unformatted.strftime("%^b")
  end

  def milestones
    events[1..-2]
  end

  def remaining_text
    if @challenge.running?
      if remaining_time_in_hours > 0
        "#{remaining_time_in_days} days remaining"
      else
        "#{remaining_time_in_hours} hours remaining"
      end
    else
      "completed"
    end
  end

  def duration_in_seconds
    end_date_unformatted - start_date_unformatted
  end

  def remaining_time_in_seconds
    end_date_unformatted - Time.now
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
    if remaining_time_in_seconds > 0
      ((remaining_time_in_seconds / duration_in_seconds) * 100).floor
    else
      0
    end
  end

  def valid?
    events.count > 1
  end

  private
  def start_date_unformatted
    return events.first.event_time if self.valid?
    return nil
  end

  def end_date_unformatted
    return events.last.event_time if self.valid?
    return nil
  end

end
