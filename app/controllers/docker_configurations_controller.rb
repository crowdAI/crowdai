class DockerConfigurationsController < ApplicationController
  before_action :set_docker_configuration, only: [:show, :edit, :update, :destroy]

  # GET /docker_configurations
  def index
    @docker_configurations = DockerConfiguration.all
  end

  # GET /docker_configurations/1
  def show
  end

  # GET /docker_configurations/new
  def new
    @docker_configuration = DockerConfiguration.new
  end

  # GET /docker_configurations/1/edit
  def edit
  end

  # POST /docker_configurations
  def create
    @docker_configuration = DockerConfiguration.new(docker_configuration_params)

    if @docker_configuration.save
      redirect_to @docker_configuration, notice: 'Docker configuration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /docker_configurations/1
  def update
    if @docker_configuration.update(docker_configuration_params)
      redirect_to @docker_configuration, notice: 'Docker configuration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /docker_configurations/1
  def destroy
    @docker_configuration.destroy
    redirect_to docker_configurations_url, notice: 'Docker configuration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_docker_configuration
      @docker_configuration = DockerConfiguration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def docker_configuration_params
      params.require(:docker_configuration).permit(:challenge_id, :container, :mount_point, :existing_mount_point, :destroy_after_success, :execute_command)
    end
end
