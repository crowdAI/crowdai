class TopicNotificationMailer < ApplicationMailer

  def sendmail(participant_id,topic_id)
    participant = Participant.find(participant_id)
    topic = Topic.find(topic_id)
    options = format_options(participant,topic)
    @model_id = topic_id
    mandrill_send(options)
  end

  def format_options(participant,topic)
    challenge = topic.challenge

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
          content:        email_body(challenge,topic)
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

  def topic_link(topic)
    link_to 'here', new_topic_comment_url(topic)
  end

  def email_body(challenge,topic)
    "<div>" +
      "<p>A new topic has been made in the " +
      "#{challenge_link(challenge)} challenge.</p>" +
      "<br/>" +
      "#{topic.topic}" +
      "<br/>" +
      "<p>Click #{topic_link(topic)} to see the comment.</p>" +
    "</div>"
  end

end
