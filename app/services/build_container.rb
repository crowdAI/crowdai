class BuildContainer

  def run(configuration_id)
    config = DockerConfiguration.find(configuration_id)
    base_image = Docker::Image.create('fromImage' => config.container)
    image = base_image.insert_local('localPath' => 'scripts/docker/callback.sh', 'outputPath' => config.mount_point)
    container = Docker::Container.create('Cmd' => '/project/callback.sh', 'Image' => image.id)
    c = DockerContainer.create!(image_id: base_image.id, container_id: container.id)
    c.container_log.create!(log_level: :info, message: 'Container created')
    container.start
    c.container_log.create!(log_level: :info, message: 'Container launched')
  end

end


#config = DockerConfiguration.find(1)
#base_image = Docker::Image.create('fromImage' => 'ubuntu:14.04')
#image = base_image.insert_local('localPath' => 'scripts/docker/callback.sh', 'outputPath' => config.mount_point)
