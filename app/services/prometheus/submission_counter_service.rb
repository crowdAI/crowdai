class Prometheus::SubmissionCounterService < Prometheus::PrometheusService
  include Prometheus::Controller

  def initialize(submission_id:)
    @submission = Submission.find(submission_id)
  end

  def call
    payload = {
      challenge: @submission.challenge.challenge,
      challenge_id: @submission.challenge_id,
      participant_id: @submission.participant_id,
      status: @submission.grading_status_cd
    }
    SUBMISSION_COUNTER.increment(payload, 1)
  end

end
