class SubmissionGraderJob < BaseJob
  queue_as :default

  def perform(submission_id)
    Grader.new(submission_id).grade
  end

end
