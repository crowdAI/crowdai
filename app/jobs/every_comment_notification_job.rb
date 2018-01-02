class EveryCommentNotificationJob < ApplicationJob
  queue_as :default

  def perform(comment_id)
    comment = Comment.find(comment_id)
    participant_ids(comment_id).each do |participant_id|
      CommentNotificationMailer.new.sendmail(participant_id, comment_id)
      NotificationService.new(participant_id,comment,'comment').call
    end
  end

  def participant_ids(comment_id)
    CommentEveryEmailParticipantsQuery.new(comment_id).call
  end
end
