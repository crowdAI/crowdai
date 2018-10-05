class ParallelSubmissionsAllowedService

  def initialize(challenge,participant)
    @challenge = challenge
    @participant = participant
    # TODO add parallel_submissions to views.
    @round = ChallengeRound.find(@challenge.current_round.id)
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
