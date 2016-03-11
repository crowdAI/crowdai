# direct AWS initializer for direct S3 uploads
Aws.config.update({
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(
    ENV['AWS_ACCESS_KEY_ID'],
    ENV['AWS_SECRET_ACCESS_KEY']
  )
})

s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])
S3_BUCKET = s3.bucket(ENV['AWS_BUCKET_CROWDAI'])
