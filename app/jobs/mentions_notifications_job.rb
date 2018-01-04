class MentionsNotificationsJob < ApplicationJob
  queue_as :default

  def perform(mentioned_names:,comment_id:)
    comment = Comment.find(comment_id)
    recipients.each do |participant|
      NotificationService.new(participant.id,comment,'mention')
    end
  end

  def recipients
    Participant.where(name: mentioned_names)
  end
end
