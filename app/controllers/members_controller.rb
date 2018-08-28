class MembersController < ApplicationController
  before_action :authenticate_participant!, except: [:show]
  before_action :set_organizer

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
    participant = Participant.friendly.find(params[:id])
    participant.update(organizer_id: nil)
    redirect_to organizer_members_path(@organizer)
  end

  private
  def strong_params
    params.require(:member).permit(:email)
  end

  def set_organizer
    @organizer = Organizer.friendly.find(params[:organizer_id])
  end

end
