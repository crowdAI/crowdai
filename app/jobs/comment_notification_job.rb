class CommentNotificationJob < ApplicationJob
  queue_as :default

  def perform(comment_id)
    comment = Comment.find(comment_id)
    Rails.logger.debug "participants: #{participant_ids(comment_id)}"
    participant_ids(comment_id).each do |participant_id|
      email_preference = EmailPreference.where(participant_id: participant_id).first
      if email_preference.receive_every_email && comment.participant_id != participant_id
        Rails.logger.debug "Mailing for #{participant_id}"
        CommentNotificationMailer.new.sendmail(participant_id, comment_id)
      end
    end
  end

  def participant_ids(comment_id)
    CommentParticipantsQuery.new(comment_id).call
  end

end
