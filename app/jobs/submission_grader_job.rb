class SubmissionGraderJob < ApplicationJob
  queue_as :default

  def perform(submission_id)
    submission = Submission.find(submission_id)
    #Grader.new(submission_id).grade
  end

end

# https://grader.crowdai.org:10000/enqueue_grading_job

# submission_id
# s3_key
# participant api key
# challenge_client_name
# grader_identifier -> grader_id
