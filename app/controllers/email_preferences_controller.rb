class EmailPreferencesController < ApplicationController
  before_action :set_participant
  #before_action :set_email_preference
  before_action :unsubscribe_token_or_authenticate
  #after_action :verify_authorized


  def edit
    #authorize @email_preference
  end

  def update
    #authorize @email_preference
    if @email_preference.update(email_preference_params)
      redirect_to edit_participant_email_preference_path(@participant, @email_preference), notice: 'Your email preferences were successfully updated.'
    else
      render :edit
    end
  end


  private
    def set_email_preference
      authenticate_participant!
      @email_preference = EmailPreference.find(params[:id])
    end

    def set_participant
      @participant = Participant.friendly.find(params[:participant_id])
    end

    def email_preference_params
      params.require(:email_preference).permit(:participant_id, :opt_out_all, :newsletter, :my_leaderboard, :any_post, :my_topic_post, :any_leaderboard)
    end

    def unsubscribe_token_or_authenticate
      if params[:unsubscribe_token].present?
        email = Email.where(participant_id: @participant.id, email_preferences_token: params[:unsubscribe_token])[0]
        if email.blank? || email.token_expiration_dttm < DateTime.current || current_participant && (email.participant_id != current_participant.id)
          #byebug
          flash[:error] = 'The unsubscribe link is invalid or expired.'
          redirect_to '/'
        else
          @email_preference = @participant.email_preferences.first
        end
      else  # no token in url - user has not come via an email link
        set_email_preference
      end
    end

end
