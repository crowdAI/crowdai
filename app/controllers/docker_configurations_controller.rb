class DockerConfigurationsController < ApplicationController
  before_action :set_docker_configuration, only: [:show, :edit, :update, :destroy]
  before_action :set_challenge

  def index
    @docker_configurations = @challenge.docker_configurations
  end


  def new
    @docker_configuration = DockerConfiguration.new(challenge_id: @challenge.id)
  end

  def edit
  end

  def create
    @docker_configuration = DockerConfiguration.new(docker_configuration_params)

    if @docker_configuration.save
      redirect_to challenge_docker_configurations_path(@challenge), notice: 'Docker configuration was successfully created.'
    else
      render :new
    end
  end

  def update
    if @docker_configuration.update(docker_configuration_params)
      redirect_to challenge_docker_configurations_path(@challenge), notice: 'Docker configuration was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @docker_configuration.destroy
    redirect_to challenge_docker_configurations_path(@challenge), notice: 'Docker configuration was successfully destroyed.'
  end

  private
    def set_docker_configuration
      @docker_configuration = DockerConfiguration.find(params[:id])
    end

    def set_challenge
      @challenge = Challenge.friendly.find(params[:challenge_id])
    end

    def docker_configuration_params
      params.require(:docker_configuration).permit(:challenge_id, :name, :image, :mount_point, :destroy_after_success, :execute_command,
                docker_files_attributes: [:id, :_destroy, :configuration_file_s3_key, :directory])
    end
end
