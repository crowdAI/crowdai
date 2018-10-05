class ParallelSubmissionsAllowedService

  def initialize(challenge,participant)
    @challenge = challenge
    @participant = participant
    @round = @challenge.current_round
  end

  def call
    return true if @round.parallel_submissions == 0
    parallel_submissions = @challenge.submissions
      .where(
        participant_id: @participant.id,
        grading_status_cd: 'submitted')
      .count
    if parallel_submissions >= @round.parallel_submissions
      return false
    else
      return true
    end
  end

end
