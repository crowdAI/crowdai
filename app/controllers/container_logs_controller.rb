class ContainerLogsController < ApplicationController
  before_action :set_container_log, only: [:show, :edit, :update, :destroy]
  before_action :set_container_instance

  def index
    @container_logs = @container_instance.container_logs
  end

  def show
  end

  def destroy
    @container_log.destroy
    redirect_to container_logs_url, notice: 'Container log was successfully destroyed.'
  end

  private
    def set_container_instance
      @container_instance = ContainerInstance.find(params[:container_instance_id])
      @docker_configuration = @container_instance.docker_configuration
      @challenge = @docker_configuration.challenge
    end

    def set_container_log
      @container_log = ContainerLog.find(params[:id])
    end

end
