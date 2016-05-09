class Grader
  include HTTParty

  def grade(submission_id)
    key = get_key(submission_id)
    if key
      response = call_grader(submission_id,key)
      evaluate_response(submission_id,response)
    else
      Submission.update(submission_id, grading_status: 'failed', grading_message: 'Files were not received by server.')
      raise "Grader called for submission #{submission_id} but key cannot be found"
    end
  end


  def get_key(submission_id)
    s = Submission.find(submission_id)
    key = s.submission_files.first.submission_file_s3_key
  end


  def call_grader(submission_id,key)
    begin
      response = HTTParty.get("http://54.184.7.125/api/v1/plantvillage_evaluation?submission_id=#{submission_id}&submission_key=#{key}", timeout: 1200)
    rescue
      Submission.update(submission_id, grading_status: 'failed', grading_message: 'Grading process system error.')
    end
  end


  def evaluate_response(submission_id,response)
    r = response.parsed_response

    if response.code == 200
      if r["status"] == 'success'
        # update the submission
        Submission.update(submission_id, grading_status: 'graded', score: r["f1-score"], score_secondary: r["log-loss"])
      else
        Submission.update(submission_id, grading_status: 'failed', grading_message: r["message"])
       # TODO email the participant
      end
    else
      Submission.update(submission_id, grading_status: 'failed', grading_message: 'Grading process system error.')
      raise "API call to grader failed #{response.inspect}"
    end
  end

end

# TESTS
# 1) Invalid header format
# curl "http://54.184.7.125/api/v1/plantvillage_evaluation?submission_id=234&submission_key=submission_files/3da7e968-94b2-4ff5-a7a7-29eab1cffaf9/submission.csv"


# 2) Successful grading
# curl "http://54.184.7.125/api/v1/plantvillage_evaluation?submission_id=234&submission_key=submission_files/2af25ed3-3bf2-4b7e-885d-f7f65755087a/classification.csv"



#c
# curl -X GET -G http://54.184.7.125/api/v1/plantvillage_evaluation -d "id=234" -d "submission_key=submission_files/3da7e968-94b2-4ff5-a7a7-29eab1cffaf9/submission.csv"
