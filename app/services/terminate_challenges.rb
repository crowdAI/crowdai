class TerminateChallenges

  def call
    running_challenges = Challenge.where(status_cd: :running)
    running_challenges.each do |c|
      if c.end_dttm.present? && c.end_dttm <= Time.current
        c.update(status: :completed, featured_sequence: 0)
      end
    end
  end

end
