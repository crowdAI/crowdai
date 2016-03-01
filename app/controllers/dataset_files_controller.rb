# == Schema Information
#
# Table name: dataset_files
#
#  id         :integer          not null, primary key
#  dataset_id :integer
#  seq        :integer
#  filename   :string
#  filetype   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DatasetFilesController < ApplicationController
  before_action :set_dataset_file, only: [:show, :edit, :update, :destroy]

  # GET /dataset_files
  def index
    @dataset_files = DatasetFile.all
  end

  # GET /dataset_files/1
  def show
  end

  # GET /dataset_files/new
  def new
    @dataset_file = DatasetFile.new
  end

  # GET /dataset_files/1/edit
  def edit
  end

  # POST /dataset_files
  def create
    @dataset_file = DatasetFile.new(dataset_file_params)

    if @dataset_file.save
      redirect_to @dataset_file, notice: 'Dataset file was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dataset_files/1
  def update
    if @dataset_file.update(dataset_file_params)
      redirect_to @dataset_file, notice: 'Dataset file was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dataset_files/1
  def destroy
    @dataset_file.destroy
    redirect_to dataset_files_url, notice: 'Dataset file was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_file
      @dataset_file = DatasetFile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dataset_file_params
      params.require(:dataset_file).permit(:dataset_id, :seq, :filename, :filetype)
    end
end
