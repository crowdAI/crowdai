class ParticipantClefTasksController < ApplicationController
  respond_to :js, :html

  def create
    clef_task = ClefTask.find(params[:participant_clef_task][:clef_task_id])
    participant_clef_task = ParticipantClefTask.where(clef_task_id: strong_params[:clef_task_id], participant_id: current_participant.id).first
    if participant_clef_task.blank?
      participant_clef_task = ParticipantClefTask.create!(strong_params.merge(status_cd: 'requested'))
    else
      participant_clef_task.update(strong_params)
    end
    set_status(clef_task,participant_clef_task)
    respond_to do |format|
      format.html { redirect_to clef_task_task_dataset_files_path(clef_task, challenge_id: params[:participant_clef_task][:challenge_id]) }
    end
  end

  def update
    clef_task_id = params[:id]
    participant_clef_task = ParticipantClefTask.where(clef_task_id: clef_task_id, participant_id: params[:participant_id]).first
    participant_clef_task.update(status_cd: 'registered')
    respond_to do |format|
      format.html { redirect_to challenge_clef_task_path(params[:challenge_id]) }
    end
  end

  def strong_params
    params.require(:participant_clef_task)
          .permit(:clef_task_id,
                  :eua_file)
          .merge(participant_id: current_participant.id)
  end

  def set_status(clef_task,participant_clef_task)
    if clef_task.eua_required?
      if participant_clef_task.eua_file.present?
        participant_clef_task.update(status_cd: 'submitted')
      end
    else
      unless participant_clef_task.registered?
        participant_clef_task.update(status_cd: 'registered')
      end
    end
  end

end
