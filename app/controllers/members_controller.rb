class MembersController < ApplicationController
  before_action :authenticate_participant!, except: [:show]
  before_action :set_organizer, only: [:show, :edit, :update, :destroy]
  #after_action :verify_authorized

  def index
    @organizer = Organizer.friendly.find(params[:organizer_id])
    @challenges = @organizer.challenges
    @members = @organizer.participants
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def strong_params
    params.require(:member).permit(:email)
  end

end
