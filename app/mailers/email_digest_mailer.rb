class EmailDigestMailer < ApplicationMailer

  def sendmail(participant_id,digest_type)
    participant = Participant.find(participant_id)
    start_dttm = set_start_dttm(digest_type)

    body = summarize_comment_notification_mailer(participant,start_dttm) << '<br/>'
    body << summarize_submission_notification_mailer(participant,start_dttm) << '<br/>'

    participant = Participant.find(participant_id)
    options = format_options(participant,comment)
    @model_id = comment_id
    mandrill_send(options)
  end

  def set_start_dttm(digest_type)
    start_dttm = Time.now - 24.hours if digest_type == 'daily'
    start_dttm = Time.now - 7.days if digest_type == 'weekly'
    return start_dttm
  end

  def summarize_comment_notification_mailer(participant,start_dttm)
    comments = ParticipantCommentsQuery.new(participant,start_dttm).call
  end

  def summarize_submission_notification_mailer(participant,start_dttm)
    return nil if !participant.admin?
  end

  def format_options(participant,comment)
    topic = comment.topic
    challenge = comment.topic.challenge

    options = {
      participant_id:   participant.id,
      subject:          "[crowdAI/#{challenge.challenge}] #{topic.topic}",
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
        }
      ]
    }
  end

end
