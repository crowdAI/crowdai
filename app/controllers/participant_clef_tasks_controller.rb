class ParticipantClefTasksController < ApplicationController
  respond_to :js, :html

  def create
    participant_clef_task = ParticipantClefTask.where(clef_task_id: strong_params[:clef_task_id], participant_id: current_participant.id)
    if participant_clef_task.empty?
      participant_clef_task = ParticipantClefTask.create!(strong_params)
    else
      participant_clef_task.update(strong_params)
    end
    respond_to do |format|
      format.html { redirect_to clef_task_task_dataset_files_path(participant_clef_task.clef_task) }
    end
  end

  def update
  end

  def destroy

  end

  def strong_params
    params.require(:participant_clef_task)
          .permit(:clef_task_id,
                  :eua_file)
          .merge(participant_id: current_participant.id)
  end

end
