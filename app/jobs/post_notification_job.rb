class PostNotificationJob < BaseJob
  queue_as :default

  def perform(post)
    subscribed_participants(post.id).each do |i|
      puts "Processing id: #{i}"
    end
  end

  def subscribed_participants(post_id)
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
