class TerminateChallenges

  def call
    running_challenges = Challenge.where(status_cd: :running)
    running_challenges.each do |c|
      if c.end_dttm <= Time.current
        c.update(status: :completed)
      end
    end
  end

end
