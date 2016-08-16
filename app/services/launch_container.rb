def LaunchContainer

  def initialize(configuration_id)
    @config = DockerConfiguration.find(configuration_id)
    validate!
  end


  def launch(configuration_id)
    container = self.build
    instance = DockerContainer.create!(image_id: base_image.id, container_id: container.id)
    instance.container_logs.create!(log_level: :info, message: 'Container created')
    instance.start
    instance.container_logs.create!(log_level: :info, message: 'Container started')
  end


  def build
    base_image = Docker::Image.create('fromImage' => @config.container)
    files_array = @config.docker_files.map(&:configuration_file_s3_key)
    image = base_image.insert_local('localPath' => files_array, 'outputPath' => @config.mount_point)
    container = Docker::Container.create('Cmd' => @config.execute_command, 'Image' => image.id)
  end


  private
  def validate!
    raise ArgumentError.new("DockerConfiguration could not be found") if @config.nil?
  end
end
