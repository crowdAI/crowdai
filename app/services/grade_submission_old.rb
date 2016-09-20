class GradeSubmissionOld < LaunchContainer

  def initialize(configuration_id,submission_id)
    @config = DockerConfiguration.find(configuration_id)
    @submission = Submission.find(submission_id)
    validate!
  end


  def grade(configuration_id,submission_id)
    config = DockerConfiguration.find(configuration_id)
    base_image = Docker::Image.create('fromImage' => config.container)
    image = base_image.insert_local('localPath' => 'scripts/docker/callback.sh', 'outputPath' => config.mount_point)
    container = Docker::Container.create('Cmd' => '/project/callback.sh', 'Image' => image.id)
    c = DockerContainer.create!(image_id: base_image.id, container_id: container.id)
    c.container_log.create!(log_level: :info, message: 'Container created')
    container.start
    c.container_log.create!(log_level: :info, message: 'Container launched')
  end


  def callback_script(id)
    #curl -X PUT -G https://crowdai-stg.herokuapp.com/api/v1/docker_callbacks/create -d "score=999999" -d "score_secondary=123456" -H 'Authorization: Token token="***REMOVED***"'
  end

  private
  def validate!
    raise ArgumentError.new("Submission could not be found") if @submission.nil?
    super
  end


end


# config = DockerConfiguration.find(1)
# base_image = Docker::Image.create('fromImage' => config.container)
# files_injection = config.docker_files.map(&:configuration_file_s3_key)
# image = base_image.insert_local('localPath' => files_injection, 'outputPath' => config.mount_point)

# image = base_image.insert_local('localPath' => 'scripts/docker/callback.sh', 'outputPath' => config.mount_point)
