class CommentNotificationJob < BaseJob
  queue_as :default

  def perform(comment)
    subscribed_participant_ids(comment).each do |participant_id|
      if comment.participant_id != participant_id
        CommentNotificationMailer.new.sendmail(participant_id, comment.id)
      end
    end
  end

  def immediate_send_participant_ids(comment)
    Add 5 minute delay to instant discussion emails
  end

  def delayed_send_participant_ids(comment)

  end

  def subscribed_participant_ids(comment)
    ids = admin_ids.concat(comment_participant_ids(comment))
    ids.uniq
  end

  def admin_ids
    Participant.where(admin: true).pluck(:id)
  end

  def comment_participant_ids(comment)
    Comment.joins("LEFT JOIN email_preferences ON comments.participant_id = email_preferences.participant_id")
           .where(comments: {topic_id: comment.topic_id}, email_preferences: { my_topic_post: true })
           .pluck(:participant_id)
  end

end
