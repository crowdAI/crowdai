class Api::ClefTasksController < Api::BaseController
  before_action :auth_by_api_key, only: [:show]

  def show  # GET :id
    begin
      clef_task = ClefTask.find(params[:id])
      # get clef participants with optional paramater status
      message = clef_participants(clef_task, params[:status])
      status = :ok
    rescue ActiveRecord::RecordNotFound
      status = :not_found
      message = "clef_task_id #{params[:id]} not found"
    rescue => e
      message = e
    ensure
      Rails.logger.info "API: #{message}"
      render :json => {message: message}, :include =>
        {:participant => {:only => [:email,:name,:affiliation,:first_name,:last_name,:address,:city,:country_cd]}},
          :except => [:created_at, :updated_at, :eua_file, :id, :approved], status:status
    end
  end

  def clef_participants(clef_task, status_cd)
    participant_clef_tasks = clef_task.participant_clef_tasks.includes(:participant)
    if status_cd.present?
      return participant_clef_tasks.where({status_cd: status_cd});
    end
    return participant_clef_tasks
  end

end
