class Organizer::EuaNotificationMailer < ApplicationMailer

  def sendmail(organizer_participant_id, clef_task_id, participant_id)
    organizer_participant = Participant.find(organizer_participant_id)
    participant = Participant.find(participant_id)
    clef_task = ClefTask.find(clef_task_id)
    options = format_options(organizer_participant,participant,clef_task)
    mandrill_send(options)
  end

  def format_options(organizer_participant,participant,clef_task)
    options = {
      participant_id:   organizer_participant.id,
      subject:          "[ImageCLEF CrowdAI] - New EUA uploaded for #{clef_task.task}",
      to:               organizer_participant.email,
      template:         "crowdAI General Template",
      global_merge_vars: [
        {
          name:           "NAME",
          content:        "#{organizer_participant.name}"
        },
        {
          name:           "BODY",
          content:        email_body(participant,clef_task)
        },
        { name:           'EMAIL_PREFERENCES_LINK',
          content:        EmailPreferencesTokenService
                            .new(organizer_participant)
                            .email_preferences_link }
      ]
    }
  end

  def challenge_link(challenge)
    link_to 'here', challenge_clef_task_url(challenge)
  end

  def email_body(participant,clef_task)
    challenge = clef_task.challenges.first
    "<div>" +
        "<p>#{participant.name} has uploaded an End User Agreement (EUA) for task #{clef_task.task} on crowdAI. If you are responsible for this task, please check the participant's EUA. If the form is compliant, you can approve it by clicking on the approve button next to the participant's name. In case the EUA is faulty or incomplete the participant can re-upload a new EUA.</p>" +
        "<p>You can approve the participant's EUA #{challenge_link(challenge)}</p>" +
    "</div>"
  end

end
