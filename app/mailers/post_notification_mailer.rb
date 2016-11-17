class PostNotificationMailer < ApplicationMailer

  def sendmail(participant_id,post_id)
    participant = Participant.find(participant_id)
    post = Post.find(post_id)
    options = format_options(participant,post)
    mandrill_send(options)
  end


  def format_options(participant,post)
    topic = post.topic
    challenge = post.topic.challenge

    puts email_body(challenge,topic,post)

    options = {
      subject:     "[crowdAI/#{challenge.challenge}] #{topic.topic}",
      to:           participant.email,
      template:     "crowdAI General Template",
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


  def email_body(challenge,topic,post)
    "<p>A new post has been made to the " +
    "#{link_to challenge.challenge, challenges_url(challenge)} challenge.</p>" +
    "<br/>" +
    "#{post.post}" +
    "<br/>" +
    "<p>Click #{link_to 'here', new_topic_post_url(topic)} to see the post.</p>"
  end



end
