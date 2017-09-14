class LeaderboardNotificationMailer < ApplicationMailer

  def sendmail(participant_id,submission_id)
    participant = Participant.find(participant_id)
    submission = Submission.find(submission_id)
    options = format_options(participant,submission)
    @model_id = submission_id
    mandrill_send(options)
  end


  def format_options(participant,submission)
    challenge = submission.challenge

    options = {
      participant_id:   participant.id,
      subject:          "[crowdAI/#{challenge.challenge}] Leaderboard changed",
      to:               participant.email,
      template:         "crowdAI General Template",
      global_merge_vars: [
        {
          name:           "NAME",
          content:        "#{participant.name}"
        },
        {
          name:           "BODY",
          content:        email_body(challenge,submission)
        },
        { name:           'EMAIL_PREFERENCES_LINK',
          content:        EmailPreferencesTokenService
                            .new(participant)
                            .email_preferences_link }
      ]
    }
  end

  def leaderboard_link(challenge)
    link_to 'leaderboard', challenge_leaderboards_url(challenge)
  end


  def email_body(challenge,submission)
    "<div>" +
    "<p>A new entry has been made on the " +
    "#{challenge.challenge} challenge's leaderboard.</p>" +
    "<br/>" +
    "#{submission.description}" +
    "<br/>" +
    "<p>Click #{leaderboard_link(challenge)}.</p>" +
    "</div>"
  end



end
