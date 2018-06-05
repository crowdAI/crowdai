class SubmissionDetailPresenter

  def initialize(submission:,challenge:,view_context:)
    @view = view_context
    @submission = submission
    @challenge = challenge
  end

  def challenge
    @challenge
  end

  def participant
    @participant ||= @submission.participant
  end

  def grading_history?
    false
  end

  def grader_logs
    if challenge.grader_logs
      s3_key = "grader_logs/#{@challenge.slug}/grader_logs_submission_#{@submission.id}.txt"
      s3 = S3Service.new(s3_key)
      grader_logs = s3.filestream
    end
    return grader_logs
  end

  def h
    @view
  end

end
