class S3Presigner
  def self.presign(filename)
    prefix = 'markdown/'
    limit = 1.megabyte
    extname = File.extname(filename)
    filename = "#{SecureRandom.uuid}#{extname}"
    upload_key = Pathname.new(prefix).join(filename).to_s
    s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])
    obj = s3.bucket(ENV['AWS_S3_SHARED_BUCKET']).object(upload_key)

    params = { acl: 'public-read' }
    params[:content_length] = limit

    {
      presigned_url: obj.presigned_url(:put, params),
      public_url: obj.public_url
    }
  end
end
