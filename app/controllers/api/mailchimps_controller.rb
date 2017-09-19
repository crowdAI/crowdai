class Api::MailchimpsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  respond_to :json

  def verify
    if params[:api_key] == ENV['MAILCHIMP_INBOUND_API_KEY']
      head :ok
    else
      head :unauthorized
    end
  end

  def webhook
    if params[:api_key] == ENV['MAILCHIMP_INBOUND_API_KEY']
      if params['type'] == 'unsubscribe' && params['data']['list_id'] == ENV['MAILCHIMP_LIST_ID']
        participant = Participant.where(email: params['data']['email']).first
        if participant
          email_preferences = participant.email_preferences.first
          email_preferences.update(newsletter: false)
        end
      end
      head :ok
    else
      msg = "[Api::MailchimpsController#webhook] Webhook call made with invalid API key"
      Rails.logger.error(msg)
      Rollbar.error(msg) if Rails.env.production?
      head :unauthorized
    end
  end

end
