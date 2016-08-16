class LaunchContainer

  def initialize(configuration_id)
    @config = DockerConfiguration.find(configuration_id)
    @container_instance = ContainerInstance.create!(docker_configuration_id: configuration_id, status: :initialized)
  end


  def build
    base_image = Docker::Image.create('fromImage' => @config.image)
    files_array = @config.docker_files.map{ |f| "#{f.directory}#{f.configuration_file_s3_key}" }
    image = base_image.insert_local('localPath' => files_array, 'outputPath' => @config.mount_point)
    container = Docker::Container.create('Cmd' => @config.execute_command, 'Image' => image.id)
    @container_instance.update!(image_sha: image.id, container_sha: container.id, status: :built)
    container
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

end
