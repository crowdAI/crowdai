class EmailDigestMailer < ApplicationMailer

  def sendmail(participant_id,digest_type)
    participant = Participant.find(participant_id)

    start_dttm = set_start_dttm(digest_type)
    comments = comments(participant,start_dttm)
    submissions = submissions(participant,start_dttm)

    return if comments.none? && submissions.none?

    subject = build_subject(digest_type)
    body = build_body(participant,digest_type,comments,submissions)
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
    "[crowdAI] #{digest_type} digest"
  end

  def build_body(participant,digest_type,comments,submissions)
    body = body_header(digest_type)
    body << render_comments(comments) << '<br/>'
    body << render_submissions(submissions) << '<br/>'
    return "<div>#{body}</div>"
  end

  def body_header(digest_type)
    "<div>Here's a #{digest_type} summary of activity in crowdAI.</div>"
  end

  def comments(participant,start_dttm)
    comment_ids = CommentsDigestQuery.new(participant.id,start_dttm).call
    comments = Comment.where(id: comment_ids).order('challenge_id DESC, created_at DESC')
  end

  def submissions(participant,start_dttm)
    return Submission.none if !participant.admin?
    submissions = Submission.where('created_at >= ?',start_dttm).order('challenge_id DESC, created_at DESC')
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
