class GraderService
  include HTTParty
  debug_output $stdout
  base_uri ENV["GRADER"]

  # https://grader.crowdai.org:10000/

  # submission_id
  # s3_key
  # participant api key
  # challenge_client_name
  # grader_identifier -> grader_id

  def initialize(submission_id:)
    @submission = Submission.find(submission_id)
  end

  def call
    @query = api_query
    if @query
      puts @submission.inspect
      puts @query.inspect
      response = call_grader
      evaluate_response(
        submission_id: @submission.id,
        response: response)
    else
      Submission.update(
        @submission.id,
        grading_status: 'failed',
        grading_message: 'Files were not received by server.')
      raise "Grader called for submission #{@submission.id} but key cannot be found"
    end
  end

  def call_grader
    begin
      response = self.class.get('/enqueue_grading_job"',@query)
      puts response
      return response
    rescue => e
      Submission.update(
        @submission.id,
        grading_status: 'failed',
        grading_message: 'Grading process system error.')
      raise e
    end
  end

  def evaluate_response(submission_id:,response:)
    if response
      r = response.parsed_response
      Submission.update(
        submission_id,
        grading_status: r["grading_status"],
        grading_message: r["grading_message"])
    else
      Submission.update(
        submission_id, grading_status: 'failed',
        grading_message: 'Grading process system error.')
    end
  end

  private
  def api_query
    challenge = @submission.challenge
    participant = @submission.participant
    submission_key = get_submission_key

    query = {
      grader_api_key: ENV['CROWDAI_API_KEY'],
      submission_id: @submission.id,
      challenge_client_name: challenge.challenge_client_name,
      grader_id: challenge.grader_identifier,
      file_key: get_submission_key,
      participant_api_key: participant.api_key
    }
  end

  def get_submission_key
    key = @submission.submission_files.first.submission_file_s3_key
  end

end
