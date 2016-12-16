class EmailPreferencesController < ApplicationController
  before_action :set_participant
  before_action :set_edit_token, only: [:edit]
  before_action :set_update_token, only: [:update]
  before_action :unsubscribe_token_or_authenticate


  def edit
    #authorize @email_preference
  end

  def update
    #authorize @email_preference
    if @email_preference.update(email_preference_params)
      if @token
        redirect_to edit_participant_email_preference_path(@participant, @email_preference, unsubscribe_token: @token), notice: 'Your email preferences were successfully updated.'
      else
        redirect_to edit_participant_email_preference_path(@participant, @email_preference), notice: 'Your email preferences were successfully updated.'
      end
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
      params.require(:email_preference).permit(:participant_id, :opt_out_all, :newsletter, :my_leaderboard, :any_post, :my_topic_post, :any_leaderboard, :unsubscribe_token)
    end

    def set_edit_token
      @token = params[:unsubscribe_token] if params[:unsubscribe_token]
    end

    def set_update_token
      if params[:email_preference][:unsubscribe_token]
        @token = params[:email_preference][:unsubscribe_token]
        params[:email_preference].delete(:unsubscribe_token)
      end
    end


    def unsubscribe_token_or_authenticate
      if @token.present?
        email = Email.where(participant_id: @participant.id, email_preferences_token: @token)[0]
        if current_participant && (email.participant_id != current_participant.id)
          flash[:error] = "The unsubscribe link is not valid for the currently logged in participant."
          redirect_to '/'
        end
        if email.blank?
          flash[:error] = "The unsubscribe link is invalid."
          redirect_to new_participant_session_path
        end
        if email.present? && email.token_expiration_dttm < DateTime.current
          flash[:error] = 'The unsubscribe link has expired.'
          redirect_to new_participant_session_path
        end
        @email_preference = @participant.email_preferences.first
      else  # no token in url - user has not come via an email link
        set_email_preference
      end
    end

end
