class Api::ClefTasksController < Api::BaseController
  before_action :auth_by_api_key, only: [:show]

  def show  # GET :id
    begin
      clef_task = ClefTask.find(params[:id])
      message = clef_participants(clef_task)
      status = :ok
    rescue ActiveRecord::RecordNotFound
      status = :not_found
      message = "clef_task_id #{params[:id]} not found"
    rescue => e
      message = e
    ensure
      Rails.logger.info "API: #{message}"
      render json: { message: message }, status: status
    end
  end

  def clef_participants(clef_task)
    return clef_task.participant_clef_tasks
  end

  class ClefTaskNotFound < StandardError
    def initialize(msg="The Clef Task ID was not found.")
      super
    end
  end

end
