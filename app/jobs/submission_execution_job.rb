class SubmissionExecutionJob < BaseJob
  queue_as :default

  def perform(submission_id)
    Executor.new(submission_id).execute
  end

end
