class TerminateChallenges

  def call
    expiring_challenges = Challenge
                   .where(status_cd: :running)
                   .where.not(end_dttm: nil)
                   .where("end_dttm <= current_timestamp")
    expiring_challenges.each do |c|
      c.update(status: :completed)
    end
  end

end
