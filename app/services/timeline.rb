class Timeline

  attr_reader :events

  def initialize(challenge)
    @events = challenge.events
  end

  def start_date
    events.first.event_time
  end

  def end_date
    events.last.event_time
  end

  def milestones
    events[1..-2]
  end

  def remaining_text
    'TBD'
  end

  def pct_passed
    49  # TODO
  end

  def pct_remaining
    51  # TODO
  end

  def valid?
    events.count > 1
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
