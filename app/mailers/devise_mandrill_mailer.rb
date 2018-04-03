class DeviseMandrillMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers

  def reset_password_instructions(record, token, opts={})
    options = {
      participant_id:   record.id,
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
      email: record.email,
      subject:  'Confirmation de compte',
      text_body: "Veuillez valider votre compte : #{confirmation_url(record, confirmation_token: token)}"
    }
    mandrill_send options
  end

  def unlock_instructions(record, token, opts={})
    options = {
      participant_id:   record.id,
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
    SES.send_email to: [options[:email]],
                   source:    ENV['AWS_MAIL_SOURCE'],
                   subject:   options[:subject],
                   text_body: options[:text_body]
  end

end
