class PostNotificationMailer < ApplicationMailer

  def mailer(participant_id,post_id)
    participant = Participant.find(participant_id)
    post = Post.find(post_id)
    debugger
    if participant && post
      options = format_options(participant,post)
      mandrill_send(options)
    end
  end


  def format_options(participant,post)
    topic = post.topic
    challenge = post.topic.challenge
    options = {
      subject:     "[crowdAI/#{challenge.challenge}] #{topic.topic}",
      to:           participant.email,
      template:     "crowdai_standard_template",
      global_merge_vars: [
        {
          name:           "SALUTATIONS",
          content:        "Dear #{participant.name}"
        },
        {
          name:           "BODY",
          content:        post.post
        },
        {
          name:           "POST_URL",
          content:        new_topic_post_url(topic)
        }
      ]
    }
  end
end
