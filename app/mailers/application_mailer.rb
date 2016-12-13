require 'securerandom'

class ApplicationMailer < ActionMailer::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include  ActionView::Helpers::TextHelper

  default(
    from: "no-reply@crowdai.org",
    reply_to: "no-reply@crowdai.org"
  )

  def mandrill_send(options={})
    unsubscribe_token = generate_unsubscribe_token
    options[:global_merge_vars] << { name: 'UNSUBSCRIBE_LINK',
                                     content: build_unsubscribe_url(options[:participant_id],unsubscribe_token) }
    message = {
      subject:      options[:subject],
      from_name:    "crowdAI",
      from_email:   "no-reply@crowdai.org",
      to: [
        {
          email:    options[:to],
          type:     "to"
        }
      ],
      global_merge_vars:  options[:global_merge_vars]
    }
    MANDRILL.messages.send_template( options[:template], [], message) unless Rails.env.staging?
    email_logger(options,unsubscribe_token)

    rescue Mandrill::UnknownTemplateError => e
      puts "#{e.class}: #{e.message}"
      Rails.logger.debug("#{e.class}: #{e.message}")
      raise
  end


  def email_logger(options,unsubscribe_token)
    Email.create!(model_id: @model_id,
                  mailer: self.class.to_s,
                  recipients: options[:to],
                  options: options,
                  status: :sent,
                  participant_id: options[:participant_id],
                  email_preferences_token: unsubscribe_token,
                  token_expiration_dttm: DateTime.current + 7.days)
  end


  def generate_unsubscribe_token
    SecureRandom.urlsafe_base64(24)
  end

  def build_unsubscribe_url(participant_id,unsubscribe_token)
    participant = Participant.find(participant_id)
    pref = participant.email_preferences.first
    return "https://www.crowdai.org/participants/#{participant.id}/email_preferences/#{pref.id}/edit?unsubscribe_token=#{unsubscribe_token}"
  end


end
