class DockerizeSubmission < LaunchContainer

  # Launches the container with the dataset files and the submission files injected
  def initialize(submission_id)
    @submission = Submission.find(submission_id)
    @config = DockerConfiguration.find(@submission.docker_configuration_id)
    @container_instance = ContainerInstance.create!(docker_configuration_id: @config.id,
                                                    submission_id: submission_id,
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


end
