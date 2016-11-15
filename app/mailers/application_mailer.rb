class ApplicationMailer < ActionMailer::Base

  default(
    from: "no-reply@crowdai.org",
    reply_to: "no-reply@crowdai.org"
  )

  def mandrill_send(options={})
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
    #puts message
    MANDRILL.messages.send_template( options[:template], [], message) unless Rails.env.staging?
  
    rescue Mandrill::UnknownTemplateError => e
      puts "#{e.class}: #{e.message}"
      Rails.logger.debug("#{e.class}: #{e.message}")
      raise
  end



end
