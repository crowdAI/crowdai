class DeviseMandrillMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers

  def reset_password_instructions(record, token, opts={})
    options = {
      subject:          "crowdAI Password Reset",
      email:            record.email,
      global_merge_vars:  [
        {
          name:         "NAME",
          content:      record.name
        },
        {
          name:         "RESET_PASSWORD_URL",
          content:      edit_password_url(record, reset_password_token: token)
        }
      ],
      template:         "crowdAI Devise reset_password_instructions"
    }
    mandrill_send options
  end

  def confirmation_instructions(record, token, opts={})
    options = {
      subject:          "crowdAI Confirmation Instructions",
      email:            record.email,
      global_merge_vars:  [
        {
          name:         "NAME",
          content:      record.name
        },
        {
          name:         "CONFIRMATION_URL",
          content:      confirmation_url(record, confirmation_token: token)
        }
      ],
      template:         "crowdAI Devise confirmation_instructions"
    }
    mandrill_send options
  end

  def unlock_instructions(record, token, opts={})
    options = {
      subject:          "crowdAI Unlock Instructions",
      email:            record.email,
      global_merge_vars:  [
        {
          name:         "NAME",
          content:      record.name
        },
        {
          name:         "UNLOCK_URL",
          content:      unlock_url(record, unlock_token: token)
        }
      ],
      template:         "crowdAI Devise unlock_instructions"
    }
    mandrill_send options
  end

  def mandrill_send(options={})
    message = {
      subject:      options[:subject],
      from_name:    "crowdAI",
      from_email:   "no-reply@crowdai.org",
      to: [
        {
          email:    options[:email],
          type:     "to"
        }
      ],
      global_merge_vars:  options[:global_merge_vars]
    }
    MANDRILL.messages.send_template( options[:template], [], message) unless Rails.env.test?

    rescue Mandrill::Error => e
      puts e.message
      Rails.logger.debug("#{e.class}: #{e.message}")
      raise
  end

end
