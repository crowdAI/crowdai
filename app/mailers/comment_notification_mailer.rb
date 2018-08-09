class CommentNotificationMailer < ApplicationMailer

  def sendmail(participant_id,comment_id)
    participant = Participant.find(participant_id)
    comment = Comment.find(comment_id)
    options = format_options(participant,comment)
    @model_id = comment_id
    mandrill_send(options)
  end

  def format_options(participant,comment)
    topic = comment.topic
    challenge = comment.topic.challenge

    options = {
      participant_id:   participant.id,
      subject:          "[crowdAI/#{challenge.challenge}] New discussion comment",
      to:               participant.email,
      template:         "crowdAI General Template",
      global_merge_vars: [
        {
          name:           "NAME",
          content:        "#{participant.name}"
        },
        {
          name:           "BODY",
          content:        email_body(challenge,topic,comment)
        },
        { name:           'EMAIL_PREFERENCES_LINK',
          content:        EmailPreferencesTokenService
                            .new(participant)
                            .email_preferences_link }
      ]
    }
  end

  def challenge_link(challenge)
    link_to challenge.challenge, challenge_url(challenge)
  end

  def comment_link(topic)
    link_to 'here', new_topic_comment_url(topic)
  end

  def email_body(challenge,topic,comment)
    "<div>" +
      "<p>A new comment has been made to the " +
      "#{challenge_link(challenge)} challenge.</p>" +
      "<br/>" +
      "#{comment.comment}" +
      "<br/>" +
      "<p>Click #{comment_link(topic)} to see the comment.</p>" +
    "</div>"
  end

end
