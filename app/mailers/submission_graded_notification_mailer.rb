class SubmissionGradedNotificationMailer < ApplicationMailer

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
      subject:     "[crowdAI/#{challenge.challenge}] Submission graded",
      to:           participant.email,
      template:     "crowdAI General Template",
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


  def email_body(challenge,submission)
    "<div>" +
    "<p>Your submission to the " +
    "#{challenge.challenge} challenge has now been graded.</p>" +
    "<br/>" +
    grading_message(submission) +
    "<pre>#{submission.description}</pre>" +
    "<br/>" +
    "<p>Click #{link_to 'submissions', challenge_submissions_path(challenge), only_path: false} to see the submission.</p>" +
    "</div>"
  end


  def grading_message(submission)
    msg = ' '
    if submission.failed?
      msg = '<p>There was an error!<br/>' +
            + submission.grading_message + '</p>'
    end

    if submission.graded?
      if submission.score_secondary.nil?
        msg = '<p>The score is: ' + submission.score + '</p>'
      else
        msg = '<p>The primary score is: ' + submission.score + '<br/>' +
               'The secondary score is: ' + submission.score_secondary + '</p>'
      end
    end
    return msg
  end


end
