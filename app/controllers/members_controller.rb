class MembersController < ApplicationController
  before_action :authenticate_participant!, except: [:show]
  before_action :set_organizer#, only: [:index, :new, :create, :destroy]
  #after_action :verify_authorized

  def index
    @challenges = @organizer.challenges
    @members = @organizer.participants
  end

  def new
    @challenges = @organizer.challenges
    @members = @organizer.participants
  end

  def create
    participant = Participant.where(email: strong_params[:email]).first
    if participant.blank?
      flash[:error] = "No crowdAI participant can be found with that email address"
    end
    if participant.present? && participant.organizer_id.present?
      flash[:error] = "Participant is already assigned to an Organizer"
    end
    if participant.present? && participant.organizer_id.blank? && participant.update(organizer_id: @organizer.id)
      flash[:info] = "Participant added as an Organizer"
    end
    redirect_to organizer_members_path(@organizer)
  end

  def destroy
  end

  private
  def strong_params
    params.require(:member).permit(:email)
  end

  def set_organizer
    @organizer = Organizer.friendly.find(params[:organizer_id])
  end

end
