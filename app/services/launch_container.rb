class LaunchContainer

  def initialize(configuration_id)
    @config = DockerConfiguration.find(configuration_id)
    @container_instance = ContainerInstance.create!(docker_configuration_id: configuration_id,
                                                    status: :initialized)
    @tmpdir = tmpdir
    @files_array = files_array
  end


  def build
    begin
      @container_instance.container_logs.create!(log_level: :info, message: "Building container from image #{@config.image}.")
      base_image = Docker::Image.create('fromImage' => @config.image)
      image = base_image.insert_local('localPath' => @files_array, 'outputPath' => @config.mount_point)
      container = Docker::Container.create('Cmd' => @config.execute_command, 'Image' => image.id)
      @container_instance.update!(image_sha: image.id, container_sha: container.id, status: :built)
      @container_instance.container_logs.create!(log_level: :info, message: "Container built.")
      return container
    rescue => e
      @container_instance.update!(status: :error, message: e.message)
      raise e
    end
  end


  def start
    container = self.build
    @container_instance.container_logs.create!(log_level: :info, message: 'Container created')
    if container.start
      @container_instance.update!(status: :started)
      @container_instance.container_logs.create!(log_level: :info, message: 'Container started')
    else
      @container_instance.container_logs.create!(log_level: :error, message: 'Could not start container')
    end
  end

  def s3_keys
    s3_keys_array = @config.docker_files.map{ |f| f.configuration_file_s3_key }
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
