class Grader
  include HTTParty
  debug_output $stdout
  base_uri "#{ENV["GRADER"]}/api/v1/"

  def initialize(submission_id)
    @submission = Submission.find(submission_id)
  end


  def grade
    @query = api_query
    if @query
      puts @submission.inspect
      puts @query.inspect
      response = call_grader
      evaluate_response(@submission.id,response)
    else
      Submission.update(@submission.id, grading_status: 'failed', grading_message: 'Files were not received by server.')
      raise "Grader called for submission #{@submission_id} but key cannot be found"
    end
  end


  def call_grader
    begin
      response = self.class.get('/grade',@query)
      puts response
      return response
    rescue => e
      Submission.update(@submission_id, grading_status: 'failed', grading_message: 'Grading process system error.')
      raise e
    end
  end


  def evaluate_response(submission_id,response)
    if response
      r = response.parsed_response
      Submission.update(submission_id, grading_status: r["grading_status"], grading_message: r["grading_message"])
    else
      Submission.update(submission_id, grading_status: 'failed', grading_message: 'Grading process system error.')
    end
  end


  private
  def api_query
    c = @submission.challenge
    submission_key = get_submission_key
    return false if submission_key.blank? || c.answer_file_s3_key.blank?
    if c.threshold.present?
      query = { query: { submission_id: @submission.id,
                       grader: c.grader,
                       grading_factor: c.grading_factor,
                       threshold: c.threshold,
                       answer_key: c.answer_file_s3_key,
                       submission_key: get_submission_key }}
    else
        query = { query: { submission_id: @submission.id,
                         grader: c.grader,
                         grading_factor: c.grading_factor,
                         answer_key: c.answer_file_s3_key,
                         submission_key: get_submission_key }}
    end
  end


  def get_submission_key
    key = @submission.submission_files.first.submission_file_s3_key
  end

end
