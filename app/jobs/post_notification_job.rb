class PostNotificationJob < BaseJob
  queue_as :default

  def perform(post)
    debugger
    subscribed_participant_ids(post.id).each do |row_id|
      PostNotificationMailer.mailer(post.id, row_id)
    end
  end

  def subscribed_participant_ids(post_id)
    ids = admin_ids.concat(post_participants(post_id))
    ids.uniq
  end


  def admin_ids
    Participant.where(admin: true).pluck(:id)
  end


  def post_participants(post_id)
    post = Post.find(post_id)
    Post.where(topic_id: post.topic_id).pluck(:participant_id)
  end
end
