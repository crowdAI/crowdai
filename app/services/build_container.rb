class BuildContainer

  def run(configuration_id)
    config = DockerConfiguration.find(configuration_id)
    image = Docker::Image.create('fromImage' => 'busybox')
    puts "created image #{image.inspect}"
    image.insert_local('localPath' => 'scripts/docker/callback.sh', 'outputPath' => config.mount_point)
    puts "inserted files"
    container = Docker::Container.create('Cmd' => ['bash'], 'Image' => image)
    puts 'image created'
  end

end
