class Executor
  include HTTParty
  debug_output $stdout
  base_uri "#{ENV["GRADER"]}/api/v1/"

  def initialize(submission_id)
    @submission = Submission.find(submission_id)
  end


  def execute
    @query = api_query
    if @query
      response = call_executor
      evaluate_response(@submission.id,response)
    else
      Submission.update(@submission.id, grading_status: 'failed', grading_message: 'Files were not received by server.')
      raise "Executor called for submission #{@submission_id} but key cannot be found"
    end
  end


  def call_executor
    begin
      response = self.class.get('/execute',@query)
      puts response
      return response
    rescue => e
      Submission.update(@submission_id, grading_status: 'failed', grading_message: 'Execution process system error.')
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
    model_key = get_model_key
    return False if model_key.blank? || c.answer_file_s3_key.blank?
    query = { query: { submission_id: @submission.id,
                       framework: @submission.framework,
                       model_key: model_key }}
  end


  # TODO need to use a filetype selector instead of position
  def get_model_key
    key = @submission.submission_files.second.submission_file_s3_key
  end

end
