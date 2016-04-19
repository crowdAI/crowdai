class SubmissionGraderJob < BaseJob
  queue_as :default

  def perform(*args)
    @logger.info("grader running for: #{args[0]}")
    submission_id = args[0][:submission_id]
    submission = Submission.find(submission_id)
    s3_key = submission.submission_files.first.submission_file_s3_key
    s3_url = s3_expiring_url(s3_key)
    @logger.info("s3_key: #{s3_key}, url: #{s3_url}")
  end

  def s3_expiring_url(s3_key)
    s3_file_obj = Aws::S3::Object.new(bucket_name: ENV['AWS_S3_BUCKET'], key: s3_key)
    url = s3_file_obj.presigned_url(:get, expires_in: 3600)
  end
end
