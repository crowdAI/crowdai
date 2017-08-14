class EmailDigestMailer < ApplicationMailer

  def sendmail(participant_id,digest_type)
    participant = Participant.find(participant_id)

    body = build_body(participant,digest_type)
    options = format_options(participant,body)
    @model_id = nil
    mandrill_send(options)
  end

  def set_start_dttm(digest_type)
    start_dttm = Time.now - 24.hours if digest_type == 'daily'
    start_dttm = Time.now - 7.days if digest_type == 'weekly'
    return start_dttm
  end

  def build_body(participant,digest_type)
    start_dttm = set_start_dttm(digest_type)

    body = summarize_comment_notification_mailer(participant,start_dttm) << '<br/>'
    if participant.admin?
      body << summarize_submission_notification_mailer(participant,start_dttm) << '<br/>'
    end
    return body
  end

  def summarize_comment_notification_mailer(participant,start_dttm)
    comment_ids = CommentsDigestQuery.new(participant.id,start_dttm).call
    comments = Comment.where(id: comment_ids).order('challenge_id DESC, created_at DESC')
    if comments.any?
      body = render(partial: "mailers/comments_digest", locals: { comments: comments })
    else
      body = "<span></span>"
    end
    return body
  end

  def summarize_submission_notification_mailer(participant,start_dttm)
    submissions = Submission.where('created_at >= ?',start_dttm).order('challenge_id DESC, created_at DESC')
    if submissions.any?
      body = render(partial: "mailers/submissions_digest", locals: { submission: submissions })
    else
      body = "<span></span>"
    end
    return body
  end

  def format_options(participant,body)
    options = {
      participant_id:   participant.id,
      subject:          "[crowdAI/Summary email",
      to:               participant.email,
      template:         "crowdAI General Template",
      global_merge_vars: [
        {
          name:           "NAME",
          content:        "#{participant.name}"
        },
        {
          name:           "BODY",
          content:        body
        }
      ]
    }
  end

end
