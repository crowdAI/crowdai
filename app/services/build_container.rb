class BuildContainer

  def run(configuration_id)
    config = DockerConfiguration.find(configuration_id)
    image = Docker::Image.create('fromImage' => 'busybox')
    image.insert_local('localPath' => 'scripts/docker/callback.sh', 'outputPath' => config.mount_point)
  end

end
