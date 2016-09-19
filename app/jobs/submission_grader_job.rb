class SubmissionGraderJob < BaseJob
  queue_as :default

  def perform(submission_id)
    submission = Submission.find(submission_id)
    if submission.challenge.grader_cd == 'docker_container'
      LaunchSubmission.new(submission_id).grade
    else
      Grader.new(submission_id).grade
    end
  end

end
