class SubmissionGraderJob < BaseJob
  queue_as :default

  def perform(*args)
    @logger.info("grader running for: #{args[0]}")
    Grader.new.grade(args[0][:submission_id])
  end
end
