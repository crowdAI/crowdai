class SubmissionNotificationMailer < ApplicationMailer

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
      subject:          "[ADMIN:crowdAI/#{challenge.challenge}] Submission made",
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
        }
      ]
    }
  end


  def email_body(challenge,submission)
    "<p>A new submission has been made to the " +
    "#{challenge.challenge} challenge.</p>" +
    "<br/>" +
    "<pre>#{submission.description}</pre>" +
    "<br/>" +
    "<p>Click #{link_to 'leaderboard', challenge_leaderboards_url(challenge)} to see the submission.</p>"
  end



end
