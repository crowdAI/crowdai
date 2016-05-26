class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :edit, :update, :destroy]

  # GET /tutorials
  def index
    @tutorial = Tutorial.first
    redirect_to @tutorial
  end

  # GET /tutorials/1
  def show
  end

  # GET /tutorials/new
  def new
    @tutorial = Tutorial.new
  end

  # GET /tutorials/1/edit
  def edit
  end

  # POST /tutorials
  def create
    @tutorial = Tutorial.new(tutorial_params)

    if @tutorial.save
      redirect_to @tutorial, notice: 'Tutorial was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tutorials/1
  def update
    if @tutorial.update(tutorial_params)
      redirect_to @tutorial, notice: 'Tutorial was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tutorials/1
  def destroy
    @tutorial.destroy
    redirect_to tutorials_url, notice: 'Tutorial was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tutorial_params
      params.require(:tutorial).permit(:article, :url, :participant_id, :status_cd, :vote_count)
    end
end
