class SqsSubmissionGraderJob < BaseJob
  queue_as :default
  SQS_QUEUE_NAME = 'crowdai-prd-grading-submissions'

  def perform(*args)
    @logger.info("grader running for: #{args[0]}")
    #Grader.new.grade(args[0][:submission_id])
    submission_id = args[0][:submission_id]
    sqs = Aws::SQS::Client.new
    queue_url = queue_url(sqs)
    sqs_message = sqs_message(submission_id)
    resp = send_message(sqs,queue_url,sqs_message)
    if resp  # TODO need better validations
      Submission.update(submission_id, grading_status: 'submitted')
    end
  end

  def queue_url(sqs)
    resp = sqs.get_queue_url({ queue_name: SQS_QUEUE_NAME })
    resp.queue_url
  end


  def send_message(sqs,queue_url,sqs_message)
    resp = sqs.send_message({
        queue_url: queue_url,
        message_body: sqs_message
      })
  end


  def sqs_message(submission_id)
    s = Submission.find(submission_id)
    key = s.submission_files.first.submission_file_s3_key
    sqs_message = {challenge_id: s.challenge_id, submission_id: s.id, submission_file_s3_key: key, status: 'queued'}.to_json
    return sqs_message
  end
end
