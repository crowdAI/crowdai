# direct AWS initializer for direct S3 uploads
Aws.config.update({
  region: ENV['AWS_REGION'],
  credentials: Aws::Credentials.new(
    ENV['AWS_ACCESS_KEY_ID'],
    ENV['AWS_SECRET_ACCESS_KEY']
  )
})


s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])
S3_BUCKET = s3.bucket(ENV['AWS_S3_BUCKET'])
#S3_SHARED_BUCKET = s3.bucket(ENV['AWS_S3_SHARED_BUCKET'])

CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                 => ENV['AWS_REGION']
  }
  config.fog_directory  = ENV['AWS_S3_BUCKET']
end
