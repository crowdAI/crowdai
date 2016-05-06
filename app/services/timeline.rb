class Timeline

  attr_reader :events

  def initialize(challenge)
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
    'TBD'
  end

  def duration_in_seconds
    end_date_unformatted - start_date_unformatted
  end

  def remaining_time_in_seconds
    end_date_unformatted - Time.now
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



  # def time_remaining
  #   if running?
  #     first_milestone = timelines.first
  #     last_milestone = timelines.last
  #     challenge_duration = end_date - start_date
  #     days_left = end_date - Time.now
  #
  #     pct_left = ((days_left / challenge_duration) * 100).floor
  #     pct_passed = 100 - pct_left
  #     remaining_text = if days_left < 1
  #                        "#{(days_left / 1.day * 24).floor} hours remaining"
  #                      else
  #                        "#{(days_left / 1.day).floor} days remaining"
  #                      end
  #     return remaining_text, pct_passed, pct_left
  #   else
  #     return 'completed', 100, 0
  #   end
  # end


end
