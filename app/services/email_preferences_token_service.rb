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

end
