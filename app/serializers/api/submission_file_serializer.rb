class Api::SubmissionFileSerializer < ActiveModel::Serializer
  belongs_to :submission,
    serializer: Api::SubmissionSerializer

  attributes :id,
    :submission_file_s3_key,
    :aws_url,
    :grading_status_cd

  def aws_url
    S3Service.new(object.submission_file_s3_key).expiring_url
  end
end
