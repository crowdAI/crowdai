class TaskDatasetFileDownloadsController < InheritedResources::Base

  def create
    task_dataset_file = TaskDatasetFile.find(params[:task_dataset_file_id])
    task_dataset_file
      .task_dataset_file_downloads
      .create!(
        participant_id: current_participant.id,
        ip_address: request.remote_ip)
    head :ok
  end

end
