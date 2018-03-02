class SubmissionsRemainingQuery

  def initialize(challenge:, participant_id:)
    @challenge = challenge
    @participant_id = participant_id
  end

  def call
    return [1,nil] unless @challenge.running?
    remaining = []
    case @challenge.current_round.submission_limit_period
    when :day
      submissions = @challenge
                      .submissions
                      .where("participant_id = ? and created_at >= ?",
                      participant_id, Time.now - 24.hours)
                      .order(created_at: :asc)
      if submissions.blank?
        remaining = [
          (@challenge.current_round.submission_limit - 1),
          DateTime.now + 1.day
        ]
      else
        remaining = [
          (@challenge.current_round.submission_limit - submissions.count),
          submissions.first.created_at + 1.day
        ]
      end
    when :week
      submissions = @challenge
                      .submissions
                      .where("participant_id = ? and created_at >= ?", participant_id, Time.now - 7.days)
                      .order(created_at: :asc)
      if submissions_today.blank?
        remaining = [
          (@challenge.current_round.submission_limit - 1),
          DateTime.now + 7.days
        ]
      else
        remaining = [
          (@challenge.current_round.submission_limit - submissions.count),
          submissions.first.created_at + 1.day
        ]
      end
    when :round
      submissions = @challenge
                      .submissions
                      .where("participant_id = ? and challenge_round_id = ?", participant_id, current_round.id)
                      .count
      remaining = [
        (@challenge.current_round.submission_limit - submissions_in_round),
        nil
      ]
    end
    return remaining
  end

end
