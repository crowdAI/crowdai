class SubmissionExecutionJob < BaseJob
  queue_as :default

  def perform(submission_id)
    puts "SEAN"
  end

end
