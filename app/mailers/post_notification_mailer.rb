class PostNotificationMailer < ApplicationMailer

  def send(participant_id,post_id)
    participant = Participant.find(participant_id)
    post = Post.find(post_id)
    topic = post.topic
    challenge = post.topic.challenge
    if participant && post
      options = {
        subject:            "[crowdAI/#{challenge.challenge}] #{topic.topic}",
        email:              participant.email,
        global_merge_vars:  [
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
end
