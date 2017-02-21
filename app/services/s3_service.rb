class S3Service

  def initialize(s3_key,shared_bucket=false)
    @s3_key = s3_key
    if shared_bucket
      @bucket = ENV['AWS_S3_SHARED_BUCKET']
    else
      @bucket = ENV['AWS_S3_BUCKET']
    end
    Aws.config.update({region: ENV['AWS_REGION']})
    @bucket = Aws::S3::Resource.new.bucket(@bucket)
  end

  def valid_key?
    @bucket.object(@s3_key).exists?
  end

end
