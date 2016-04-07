class DatasetFilesController < ApplicationController
  before_action :set_dataset_file, only: [:show, :edit, :update, :destroy]
  before_action :set_challenge

  def index
    @dataset_files = DatasetFile.all
  end

  def show
  end

  def new
    @dataset_file = @challenge.dataset_files.new
  end

  def edit
  end

  def create
    @dataset_file = @challenge.dataset_files.new(dataset_file_params)

    if @dataset_file.save
      redirect_to challenge_dataset_files_path([@challenge,@dataset_file]), notice: 'Dataset file was successfully created.'
    else
      render :new
    end
  end

  def update
    if @dataset_file.update(dataset_file_params)
      redirect_to challenge_dataset_files_path([@challenge,@dataset_file]), notice: 'Dataset file was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @dataset_file.destroy
    redirect_to challenge_dataset_files_path(@challenge), notice: 'Dataset file was successfully destroyed.'
  end

  private
    def set_dataset_file
      @dataset_file = DatasetFile.find(params[:id])
    end

    def set_challenge
      @challenge = Challenge.find(params[:challenge_id])
    end

    def dataset_file_params
      params.require(:dataset_file).permit(:dataset_id, :seq, :description, :dataset_file)
    end
end
