class S3Service

  def initialize(s3_key,shared_bucket=false)
    @s3_key = s3_key
    if shared_bucket
      @bucket = ENV['AWS_S3_SHARED_BUCKET']
    else
      @bucket = ENV['AWS_S3_BUCKET']
    end
    @s3 = Aws::S3::Client.new(region: ENV['AWS_REGION'])
  end

  def valid_key?
    obj = @s3.get_object(bucket: ENV['AWS_S3_SHARED_BUCKET'], key: gif_s3_key)
    obj.exists?
  end

  def invalid_key?
    !self.valid_key?
  end

end
