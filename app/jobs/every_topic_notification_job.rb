class EveryTopicNotificationJob < ApplicationJob
  queue_as :default

  def perform(topic_id)
    topic = Topic.find(topic_id)
    pi = participant_ids(topic_id)
    participant_ids(topic_id).each do |participant_id|
      TopicNotificationMailer.new.sendmail(participant_id, topic_id)
      NotificationService.new(participant_id,topic,'topic').call
    end
  end

  def participant_ids(topic_id)
    TopicEveryEmailParticipantsQuery.new(topic_id).call
  end
end
