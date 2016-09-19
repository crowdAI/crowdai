class LaunchSubmission < LaunchContainer

  # Launches the container with the dataset files and the submission files injected
  def initialize(submission_id)
    @submission = Submission.find(submission_id)
    @config = DockerConfiguration.find(@submission.docker_configuration_id)
    @container_instance = ContainerInstance.create!(docker_configuration_id: @config.id,
                                                    status: :initialized)
    @tmpdir = tmpdir
    @files_array = files_array
  end


  def grade
    start
  end


  def s3_keys
    s3_keys_array = @config.docker_files.map{ |f| f.configuration_file_s3_key }
    s3_keys_array.concat @submission.submission_files.map{ |f| f.submission_file_s3_key }
    s3_keys_array.concat @config.challenge.dataset_files.map { |f| f.dataset_file_s3_key }
  end


  def tmpdir
    dir = "tmp/#{@submission.id}_#{Time.now.to_i}/"
    FileUtils.mkdir_p(dir)
    return dir
  end


  def download_files
    s3 = Aws::S3::Client.new
    s3_keys.each do |s3_key|
      filename = "#{@tmpdir}/#{s3_key.split('/')[-1]}"
      s3_file_obj = Aws::S3::Object.new(bucket_name: ENV['AWS_S3_BUCKET'], key: s3_key)
      resp = s3.get_object({ bucket: ENV['AWS_S3_BUCKET'], key: s3_key }, target: filename )
    end
  end


  def files_array
    download_files
    files = Dir.entries(@tmpdir).reject{ |e| File.directory? e }
    filepaths = files.map { |f| "#{@tmpdir}#{f}" }
  end

end
