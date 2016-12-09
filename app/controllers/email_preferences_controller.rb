class EmailPreferencesController < ApplicationController
  before_action :set_participant
  before_action :set_email_preference


  def edit
  end

  def update
    if @email_preference.update(email_preference_params)
      redirect_to edit_participant_email_preference_path(@participant, @email_preference), notice: 'Your email preferences were successfully updated.'
    else
      render :edit
    end
  end


  private
    def set_email_preference
      @email_preference = EmailPreference.find(params[:id])
    end

    def set_participant
      @participant = Participant.friendly.find(params[:participant_id])
    end

    def email_preference_params
      params.require(:email_preference).permit(:participant_id, :opt_out_all, :newsletter, :leaderboard_entry, :any_post, :my_topic_post, :new_leader)
    end
end
