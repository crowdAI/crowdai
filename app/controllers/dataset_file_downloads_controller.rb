class DatasetFileDownloadsController < ApplicationController
  before_action :set_dataset_file_download, only: [:show, :edit, :update, :destroy]

  # GET /dataset_file_downloads
  def index
    @dataset_file_downloads = DatasetFileDownload.all
  end

  # GET /dataset_file_downloads/1
  def show
  end

  # GET /dataset_file_downloads/new
  def new
    @dataset_file_download = DatasetFileDownload.new
  end

  # GET /dataset_file_downloads/1/edit
  def edit
  end

  # POST /dataset_file_downloads
  def create
    @dataset_file_download = DatasetFileDownload.new(dataset_file_id: params[:dataset_file_id],
                                                     participant_id: current_participant.id,
                                                     ip_address: request.remote_ip)
    @dataset_file_download.save
    head :no_content
  end

  # PATCH/PUT /dataset_file_downloads/1
  def update
    if @dataset_file_download.update(dataset_file_download_params)
      redirect_to @dataset_file_download, notice: 'Dataset file download was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dataset_file_downloads/1
  def destroy
    @dataset_file_download.destroy
    redirect_to dataset_file_downloads_url, notice: 'Dataset file download was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_file_download
      @dataset_file_download = DatasetFileDownload.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dataset_file_download_params
      params[:dataset_file_download]
    end
end
