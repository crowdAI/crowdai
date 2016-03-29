class SubmissionGraderJob < BaseJob
  queue_as :default

  def perform(*args)
    @logger.info("grader running for: #{args.to_yaml}")
  end
end
