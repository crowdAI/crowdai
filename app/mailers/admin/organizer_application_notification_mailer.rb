class Admin::OrganizerApplicationNotificationMailer < ApplicationMailer

  def sendmail(participant_id,organizer_application)
    participant = Participant.find(participant_id)
    options = format_options(participant,organizer_application)
    mandrill_send(options)
  end


  def format_options(participant,organizer_application)
    options = {
      participant_id:   participant.id,
      subject:          "[ADMIN:crowdAI] Organizer Application Requested",
      to:               participant.email,
      template:         "crowdAI General Template",
      global_merge_vars: [
        {
          name:           "NAME",
          content:        "#{participant.name}"
        },
        {
          name:           "BODY",
          content:        email_body(organizer_application)
        },
        { name:           'EMAIL_PREFERENCES_LINK',
          content:        EmailPreferencesTokenService
                            .new(participant)
                            .email_preferences_link }
      ]
    }
  end

  def email_body(organizer_application)
    "<div>" +
      "<h3>A new Organizer Application has been made.</h3>" +
      "<ul>" +
        "<li><b>Organization:</b> #{organizer_application.organization}</li>" +
        "<li><b>Contact Name:</b> #{organizer_application.contact_name}</li>" +
        "<li><b>Phone:</b> #{organizer_application.phone}</li>" +
        "<li><b>Email:</b> #{organizer_application.email}</li>" +
      "</ul>" +
      "<p>#{organizer_application.organization_description}</p>" +
      "<hr/>" +
      "<p>#{organizer_application.challenge_description}</p>" +
    "</div>"
  end

end
