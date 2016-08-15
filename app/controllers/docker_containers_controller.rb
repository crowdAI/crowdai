class DockerContainersController < ApplicationController
  before_action :set_docker_container, only: [:show, :edit, :update, :destroy]
  before_action :set_docker_configuration

  def index
    @docker_containers = DockerContainer.all
  end

  def show
  end

  def new
    @docker_container = DockerContainer.new
  end

  def edit
  end

  def create
    @docker_container = DockerContainer.new(docker_container_params)

    if @docker_container.save
      redirect_to @docker_container, notice: 'Docker container was successfully created.'
    else
      render :new
    end
  end

  def update
    if @docker_container.update(docker_container_params)
      redirect_to @docker_container, notice: 'Docker container was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @docker_container.destroy
    redirect_to docker_containers_url, notice: 'Docker container was successfully destroyed.'
  end

  private
    def set_docker_container
      @docker_container = DockerContainer.find(params[:id])
    end

    def set_docker_configuration
      @docker_configuration = DockerConfiguration.find(params[:docker_configuration_id])
      @challenge = @docker_configuration.challenge
    end

    def docker_container_params
      params.require(:docker_container).permit(:docker_configuration_id, :status_cd, :message)
    end
end
