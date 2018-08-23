class Admin::ChallengeCallResponseNotificationMailer < ApplicationMailer

  def sendmail(participant_id,challenge_call_response)
    participant = Participant.find(participant_id)
    options = format_options(participant,challenge_call_response)
    mandrill_send(options)
  end


  def format_options(participant,challenge_call_response)
    options = {
      participant_id:   participant.id,
      subject:          "[ADMIN:crowdAI] Challenge Call response",
      to:               participant.email,
      template:         "crowdAI General Template",
      global_merge_vars: [
        {
          name:           "NAME",
          content:        "#{participant.name}"
        },
        {
          name:           "BODY",
          content:        email_body(challenge_call_response)
        },
        { name:           'EMAIL_PREFERENCES_LINK',
          content:        EmailPreferencesTokenService
                            .new(participant)
                            .email_preferences_link }
      ]
    }
  end

  def email_body(challenge_call_response)
    "<div>" +
      "<h3>A new Challenge Call Response has been received.</h3>" +
      "<ul>" +
        "<li><b>Call:</b> #{challenge_call_response.challenge_call.title}</li>" +
        "<li><b>Contact Name:</b> #{challenge_call_response.contact_name}</li>" +
        "<li><b>Organization:</b> #{challenge_call_response.organization}</li>" +
        "<li><b>Phone:</b> #{challenge_call_response.phone}</li>" +
        "<li><b>Email:</b> #{challenge_call_response.email}</li>" +
      "</ul>" +
      "<hr/>" +
      "<p>#{challenge_call_response.challenge_title}</p>" +
      "<p>#{challenge_call_response.challenge_description}</p>" +
      "<a href='https://www.crowdai.org/admin/challenge_calls/#{challenge_call_response.challenge_call.slug}/challenge_call_responses/#{challenge_call_response.id}'>Full Description</a>" +
    "</div>"
  end

end
