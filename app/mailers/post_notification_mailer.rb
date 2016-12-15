class PostNotificationMailer < ApplicationMailer

  def sendmail(participant_id,post_id)
    participant = Participant.find(participant_id)
    post = Post.find(post_id)
    options = format_options(participant,post)
    @model_id = post_id
    mandrill_send(options)
    #return 'hello'
    #mandrill_mailer_send(options,post)
  end


  def mandrill_mailer_send(options,post)
    topic = post.topic
    challenge = post.topic.challenge

    mandrill_mail(
     template: "crowdAI General Template",
     subject: "[crowdAI/#{challenge.challenge}] #{topic.topic}",
     to: options[:to],
       # to: invitation.email,
       # to: { email: invitation.email, name: 'Honored Guest' },
     vars: {
       'NAME' => 'Name test',
       'BODY' => 'Body test'
     },
     important: true,
     view_content_link: true#,
     #inline_css: true
    )
  end



  def format_options(participant,post)
    topic = post.topic
    challenge = post.topic.challenge

    puts email_body(challenge,topic,post)

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
          content:        email_body(challenge,topic,post)
        }
      ]
    }
  end



=begin
  def format_options(participant,post)
    topic = post.topic
    challenge = post.topic.challenge

    puts email_body(challenge,topic,post)

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
          content:        email_body(challenge,topic,post)
        }
      ]
    }
  end
=end


  def email_body(challenge,topic,post)
    "<p>A new post has been made to the " +
    #{}"#{link_to challenge.challenge, challenges_url(challenge)} challenge.</p>" +
    "<br/>" +
    "#{post.post}" +
    "<br/>" + 'yo'
    #{}"<p>Click #{link_to 'here', new_topic_post_url(topic)} to see the post.</p>"
  end



end
