class Api::MailchimpsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  respond_to :json

  def webhook
    if params['type'] == 'unsubscribe' && params['data']['list_id'] == ENV['MAILCHIMP_LIST_ID']
      participant = Participant.where(email: params['data']['email']).first
      if participant
        email_preferences = participant.email_preferences.first
        email_preferences.update(newsletter: false)
      end
    end
    if params['type'] == 'unsubscribe' && params['data']['list_id'] == ENV['MAILCHIMP_LIST_ID']
      participant = Participant.where(email: params['data']['email']).first
      if participant
        email_preferences = participant.email_preferences.first
        email_preferences.update(newsletter: true)
      end
    end
    head :ok
  end

end
