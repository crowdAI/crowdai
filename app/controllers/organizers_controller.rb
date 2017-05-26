class OrganizersController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_organizer, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: :index


  def index
    @organizers = policy_scope(Organizer)
  end

  def show
    authorize @organizer
  end

  def new
    @organizer = Organizer.new
    authorize @organizer
  end

  def edit
    authorize @organizer
  end

  def create
    @organizer = Organizer.new(organizer_params)
    authorize @organizer

    if @organizer.save
      if current_participant.admin?
        redirect_to @organizer, notice: "Organizer has been created."
      else
        current_participant.organizer = @organizer
        current_participant.save!
        redirect_to @organizer, notice: "The request to host challenges has been submitted. After review, you will be notified when #{@organizer.organizer} may begin to host challenges."
      end
    else
      render :new
    end
  end

  def update
    authorize @organizer
    if @organizer.update(organizer_params)
      redirect_to @organizer, notice: 'Hosting organizer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @organizer
    @organizer.destroy
    redirect_to organizers_url, notice: 'Hosting organizer was successfully destroyed.'
  end

  private
    def set_organizer
      @organizer = Organizer.friendly.find(params[:id])
    end

    def organizer_params
      params.require(:organizer).permit(:organizer, :address, :description, :approved, :organizer_id, :status, :tagline, :image_file)
    end
end
