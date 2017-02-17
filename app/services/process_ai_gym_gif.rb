class ProcessAiGymGif

  def initialize(submission_id,gif_s3_key)
    @submission = Submission.find(submission_id)
    @gif_s3_key = gif_s3_key
    @s3 = Aws::S3::Client.new(region: ENV['AWS_REGION'])
  end

  def call
    gif_tempfile = download_gif(@gif_s3_key)
    m4_tempfile = convert_file(gif_tempfile)
    attach_to_submission(m4_tempfile)
  end

  def download_gif(gif_s3_key)
    gif_tempfile = Tempfile.new(['gif_file','.gif'])
    gif_tempfile.binmode
    @s3.get_object(bucket: ENV['AWS_S3_SHARED_BUCKET'], key: gif_s3_key) do |chunk|
      gif_tempfile.write(chunk)
    end
    gif_tempfile.rewind
    return gif_tempfile
  end

  def convert_file(gif_tempfile)
    Rails.logger.info "Converting GIF from submission: #{@submission.id}"
    mp4_tempfile = Tempfile.new(['mp4file','.mp4'])
    mp4_tempfile.binmode
    movie = FFMPEG::Movie.new(gif_tempfile.path)
    movie.transcode(mp4_tempfile.path) { |progress| Rails.logger.info progress }
    mp4_tempfile.rewind
    return mp4_tempfile
  end

  def attach_to_submission(m4_tempfile)
    mp4_key = "submission_files/submission_#{@submission.id}/#{SecureRandom.uuid}_gif.mp4"
    @s3.put_object(bucket: ENV['AWS_S3_BUCKET'], key: mp4_key, body: IO.read(m4_tempfile))
    @submission.submission_files.create!(seq: 0, submission_file_s3_key: mp4_key)
    Rails.logger.info "MP4 file uploaded to #{mp4_key}"
  end

end
