class SubmissionsRemainingService

  def initialize(challenge_id:,participant_id:)
    @challenge = Challenge.find(challenge_id)
    @participant = Participant.find(participant_id)
  end

  def call
    return [5, Time.zone.now]
  end
end
