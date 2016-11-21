class PostNotificationJob < BaseJob
  queue_as :default

  def perform(post)
    subscribed_participant_ids(post).each do |participant_id|
      if post.participant_id != participant_id
        PostNotificationMailer.sendmail(participant_id, post.id).deliver_now
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
    Post.where(topic_id: post.topic_id).pluck(:participant_id)
  end
end
