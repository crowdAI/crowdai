class Grader
  include HTTParty

  def grade(submission_id)
    key = get_key(submission_id)
    if key
      response = call_grader(submission_id,key)
      evaluate_response(submission_id,response)
    else
      raise "Grader called for submission #{submission_id} but key cannot be found"
    end
  end


  def get_key(submission_id)
    s = Submission.find(submission_id)
    key = s.submission_files.first.submission_file_s3_key
  end


  def call_grader(submission_id,key)
    response = HTTParty.get("http://54.184.7.125/api/v1/plantvillage_evaluation?submission_id=#{submission_id}&submission_key=#{key}")
  end


  def evaluate_response(submission_id,response)
    r = response.parsed_response

    if response.code == 200
      if r["status"] == 'success'
        # update the submission
        Submission.update(submission_id, evaluated: true, score: r["mean_f1_score"], score_secondary: r["log-loss"])
      else
        Submission.update(submission_id, evaluated: true, grading_message: r["message"])
       # TODO email the participant
      end
    else
      raise "API call to grader failed #{response.inspect}"
    end
  end

end


#http://54.184.7.125/api/v1/plantvillage_evaluation?submission_id=234&submission_key=submission_files/3da7e968-94b2-4ff5-a7a7-29eab1cffaf9/submission.csv
