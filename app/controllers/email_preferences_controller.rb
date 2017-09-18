class EmailPreferencesController < ApplicationController
  before_action :set_participant
  before_action :set_edit_token, only: [:edit]
  before_action :set_update_token, only: [:update]
  before_action :email_preferences_token_or_authenticate

  def edit
  end

  def update
    @email_preference.attributes = email_preference_params
    if @email_preference.newsletter_change == [false,true]
      # from off to on
      MailchimpService.new(@participant.id).subscribe
    end
    if @email_preference.newsletter_change == [true,false]
      # from on to off
      MailchimpService.new(@participant.id).unsubscribe
    end
    if @email_preference.save
      if @token
        redirect_to edit_participant_email_preference_path(@participant, @email_preference, unsubscribe_token: @token),
                                                          notice: 'Your email preferences were successfully updated.'
      else
        redirect_to edit_participant_email_preference_path(@participant, @email_preference),
                                                          notice: 'Your email preferences were successfully updated.'
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
    params.require(:email_preference)
          .permit(:participant_id,
                  :newsletter,
                  :challenges_followed,
                  :mentions,
                  :receive_every_email,
                  :receive_daily_digest,
                  :receive_weekly_digest,
                  :unsubscribe_token)
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

  def email_preferences_token_or_authenticate
    if @token.present?
      status = EmailPreferencesTokenService.new(current_participant).validate_token(@token)
      case status
      when 'invalid_participant'
        flash[:error] = "The email preferences link is not valid for the currently logged in participant."
        redirect_to '/'
      when 'valid_token'
        authenticate_participant!
        @email_preference = current_participant.email_preferences.first
      when 'token_expired'
        flash[:error] = 'The email preferences link has expired.'
        redirect_to new_participant_session_path
      when 'invalid_token'
        flash[:error] = "The email preferences link is invalid."
        redirect_to new_participant_session_path
      end
    else
      set_email_preference
    end
  end

  def mailchimp_list_status

  end

end
