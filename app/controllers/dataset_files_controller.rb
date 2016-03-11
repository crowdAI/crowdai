class DatasetFilesController < ApplicationController
  before_action :set_dataset_file, only: [:show, :edit, :update, :destroy]

  def index
    @dataset_files = DatasetFile.all
  end

  def show
  end

  def new
    @dataset_file = DatasetFile.new
  end

  def edit
  end

  def create
    @dataset_file = DatasetFile.new(dataset_file_params)

    if @dataset_file.save
      redirect_to @dataset_file, notice: 'Dataset file was successfully created.'
    else
      render :new
    end
  end

  def update
    if @dataset_file.update(dataset_file_params)
      redirect_to @dataset_file, notice: 'Dataset file was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @dataset_file.destroy
    redirect_to dataset_files_url, notice: 'Dataset file was successfully destroyed.'
  end

  private
    def set_dataset_file
      @dataset_file = DatasetFile.find(params[:id])
    end

    def dataset_file_params
      params.require(:dataset_file).permit(:dataset_id, :seq)
    end
end
