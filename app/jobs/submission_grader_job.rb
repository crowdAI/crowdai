class SubmissionGraderJob < BaseJob
  queue_as :default

  def perform(*args)
    Grader.new.grade(args[0][:submission_id])
  end

end
