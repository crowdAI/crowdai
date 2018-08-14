class EmailDigestMailer < ApplicationMailer

  def sendmail(participant_id,digest_type)
    participant = Participant.find(participant_id)

    start_dttm = set_start_dttm(digest_type)
    comments = comments(participant,start_dttm)
    submissions = submissions(participant,start_dttm)
    topics = topics(participant,start_dttm)
    unless participant.admin?
      return if comments.blank? && submissions.blank? && topics.blank?
    end

    subject = build_subject(digest_type)
    body = build_body(
      participant,
      digest_type,
      comments,
      submissions,
      topics)
    options = format_options(participant,subject,body)

    @model_id = nil
    mandrill_send(options)
  end

  def set_start_dttm(digest_type)
    start_dttm = Time.now - 24.hours if digest_type == 'daily'
    start_dttm = Time.now - 7.days if digest_type == 'weekly'
    return start_dttm
  end

  def build_subject(digest_type)
    "[crowdAI] #{digest_type.capitalize} digest"
  end

  def build_body(participant,digest_type,comments,submissions,topics)
    body = body_header(digest_type) << '<br/>'
    if participant.admin?
      body << render_sign_ups
    end
    body << render_comments(comments) << '<br/>'
    body << render_submissions(submissions) << '<br/>'
    body << render_topics(topics) << '<br/>'
    return "<div>#{body}</div>"
  end

  def body_header(digest_type)
    "<div>Here's a #{digest_type} summary of activity in crowdAI.</div>"
  end

  def topics(participant,start_dttm)
    topic_ids = TopicsDigestQuery.new(participant,start_dttm).call
    topics = Topic.where(id: topic_ids).order('created_at DESC')
  end

  def comments(participant,start_dttm)
    comment_ids = CommentsDigestQuery.new(participant,start_dttm).call
    comments = Comment.where(id: comment_ids).order('created_at DESC')
  end

  def submissions(participant,start_dttm)
    return Submission.none if !participant.admin?
    submissions = Submission.where('created_at >= ?',start_dttm).order('created_at DESC')
  end

  def render_sign_ups
    sign_ups = ParticipantSignUpsQuery.new.call
    body = render(partial: 'mailers/sign_ups', locals: { sign_ups: sign_ups })
    return body
  end

  def render_topics(topics)
    if topics.any?
      body = render(partial: "mailers/topics_digest", locals: { comments: comments })
    else
      body = "<span></span>"
    end
    return body
  end

  def render_comments(comments)
    if comments.any?
      body = render(partial: "mailers/comments_digest", locals: { comments: comments })
    else
      body = "<span></span>"
    end
    return body
  end

  def render_submissions(submissions)
    if submissions.any?
      body = render(partial: "mailers/submissions_digest", locals: { submission: submissions })
    else
      body = "<span></span>"
    end
    return body
  end

  def format_options(participant,subject,body)
    options = {
      participant_id:   participant.id,
      subject:          subject,
      to:               participant.email,
      template:         "crowdAI Email Digest Template",
      global_merge_vars: [
        {
          name:           "NAME",
          content:        "#{participant.name}"
        },
        {
          name:           "BODY",
          content:        body
        },
        { name:           'EMAIL_PREFERENCES_LINK',
          content:        EmailPreferencesTokenService
                            .new(participant)
                            .email_preferences_link }
      ]
    }
  end

end
