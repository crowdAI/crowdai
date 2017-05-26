class ParticipantsController < ApplicationController
  before_filter :authenticate_participant!
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def show
    @articles = Article.all
    @challenges = Challenge.all
  end


  def update
    @participant = Participant.friendly.find(params[:id])
    if @participant.update_attributes(participant_params)
      flash[:success] = "Profile updated"
      redirect_to @participant
    else
      render :edit
    end
  end

  def regen_api_key
    @participant = Participant.friendly.find(params[:participant_id])
    authorize @participant
    @participant.api_key = @participant.generate_api_key
    @participant.save!
    redirect_to edit_participant_path(@participant),notice: 'API Key regenerated.'
  end

  def sync_mailchimp
    @job = AddToMailChimpListJob.perform_later(params[:participant_id])
    render 'admin/participants/refresh_sync_mailchimp_job_status'
  end

  private
    def set_participant
      @participant = Participant.friendly.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:email, :password, :password_confirmation,
        :phone_number, :country, :city, :name, :organizer_id,
        :email_public, :bio, :website, :github, :linkedin, :twitter, :image_file)
    end

end
