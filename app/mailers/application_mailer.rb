require 'securerandom'

class ApplicationMailer < ActionMailer::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TextHelper

  def mandrill_send(options)

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
      global_merge_vars:  options[:global_merge_vars],
      attachments: options[:attachments]
    }

    res = MANDRILL.messages
      .send_template( options[:template], [], message)
    MandrillMessage.create!(
      res: res, message: message, meta: options[:meta])
    return [res, message]

    rescue Mandrill::UnknownTemplateError => e
      Rails.logger.debug("#{e.class}: #{e.message}")
      raise
  end

end
