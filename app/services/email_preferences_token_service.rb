class EmailPreferencesTokenService

  def initialize(participant)
    @participant = participant
  end

  def email_preferences_link
    "<div>" +
    "<a href='#{preferences_token_url}'>Email Preferences</a>" +
    "</div>"
  end

  def validate_token(token)
    pref_token = EmailPreferencesToken.where(email_preferences_token: token).first

    if pref_token.present?
      if @participant && @participant.id != pref_token.participant.id
        return 'invalid_participant'
      end
      if pref_token.token_expiration_dttm > DateTime.current
        pref_token.destroy!
        return 'valid_token'
      else
        pref_token.destroy!
        return 'token_expired'
      end
    else
      return 'invalid_token'
    end
  end

  private
  def preferences_token_url
    email_preferences = @participant.email_preferences.first
    url = "#{ENV['HOST']}/participants/#{@participant.id}/email_preferences/#{email_preferences.id}/edit?preferences_token=#{generate_token}"
  end

  def generate_token
    token = SecureRandom.urlsafe_base64(24)
    @participant.email_preferences_tokens.create!(email_preferences_token: token, token_expiration_dttm: DateTime.current + 30.days)
    return token
  end




=begin

    if


    found_token = participant.email_preferences_token.where(email_preferences_token: token)
    return 'not_found' if

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
  end

=end


end
