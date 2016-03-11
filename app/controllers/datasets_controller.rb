class DatasetsController < ApplicationController
  before_action :set_dataset, only: [:show, :edit, :update, :destroy]

  def index
    @datasets = Dataset.all
  end

  def show
  end

  def new
    @dataset = Dataset.new
  end

  def edit
  end

  def create
    @dataset = Dataset.new(dataset_params)

    if @dataset.save
      redirect_to @dataset, notice: 'Dataset was successfully created.'
    else
      render :new
    end
  end

  def update
    if @dataset.update(dataset_params)
      redirect_to @dataset, notice: 'Dataset was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @dataset.destroy
    redirect_to datasets_url, notice: 'Dataset was successfully destroyed.'
  end

  private
    def set_dataset
      @dataset = Dataset.find(params[:id])
    end

    def dataset_params
      params.require(:dataset).permit(:competition_id, :description)
    end
end
