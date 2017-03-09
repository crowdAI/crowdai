class PostNotificationJob < BaseJob
  queue_as :default

  def perform(post)
    subscribed_participant_ids(post).each do |participant_id|
      if post.participant_id != participant_id
        PostNotificationMailer.new.sendmail(participant_id, post.id)
      end
    end
  end


  def subscribed_participant_ids(post)
    ids = admin_ids.concat(post_participant_ids(post))
    ids.uniq
  end


  def admin_ids
    Participant.where(admin: true).pluck(:id)
  end


  def post_participant_ids(post)
    Post.joins("LEFT JOIN email_preferences ON posts.participant_id = email_preferences.participant_id")
        .where(posts: {topic_id: post.topic_id}, email_preferences: { my_topic_post: true })
        .pluck(:participant_id)
  end


end
