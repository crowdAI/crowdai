class MentionsNotificationsJob < ApplicationJob
  queue_as :notifications

  def perform(mentioned_participant_ids:,comment_id:)
    comment = Comment.find(comment_id)
    mentioned_participant_ids.each do |participant_id|
      NotificationService.new(participant_id,comment,'mention').call
    end
  end

end
