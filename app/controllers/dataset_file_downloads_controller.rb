class DatasetFileDownloadsController < ApplicationController

  def create
    dataset_file = DatasetFile.find(params[:dataset_file_id])
    dataset_file.dataset_file_downloads.create!(participant_id: current_participant.id, ip_address: request.remote_ip)
    head :ok
  end

end
