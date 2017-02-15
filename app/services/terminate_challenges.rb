class TerminateChallenges

  def call
    challenges = Challenge.where(status_cd: :running).where("end_dttm >= current_timestamp")
    challenges.each do |c|
      c.update(status: :completed)
    end
  end

end
