class SubmissionGraderJob < ApplicationJob
  queue_as :default

  def perform(submission_id)
    submission = Submission.find(submission_id)
    GraderService.new(submission_id: submission_id).call
  end

end
