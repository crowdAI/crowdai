class DockerFilesController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_docker_file, only: [:show, :edit, :update, :destroy]
  before_action :set_docker_configuration
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]


  def new
    @docker_file = DockerFile.new
  end

  def edit
  end

  def create
    @docker_file = DockerFile.new(docker_file_params.merge(docker_configuration_id: @docker_configuration.id))

    if @docker_file.save
      redirect_to [@docker_configuration.challenge,@docker_configuration], notice: 'Docker file was successfully created.'
    else
      render :new
    end
  end

  def update
    if @docker_file.update(docker_file_params)
      redirect_to [@docker_configuration.challenge,@docker_configuration], notice: 'Docker file was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @docker_file.destroy
    redirect_to [@docker_configuration.challenge,@docker_configuration], notice: 'Docker file was successfully destroyed.'
  end

  private
    def set_docker_file
      @docker_file = DockerFile.find(params[:id])
    end

    def set_docker_configuration
      @docker_configuration = DockerConfiguration.find(params[:docker_configuration_id])
      @challenge = @docker_configuration.challenge

    end

    def docker_file_params
      params.require(:docker_file)
            .permit(:docker_configuration_id, :configuration_file_s3_key, :directory, :grading_only, :overwritable)
    end


    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "docker_files/#{SecureRandom.uuid}/${filename}",
                                                 success_action_status: '201',
                                                 acl: 'public-read')
    end
end
