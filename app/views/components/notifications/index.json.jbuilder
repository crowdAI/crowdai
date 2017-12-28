json.notifications do |json|
  json.array! @notifications do |notification|
    json.id notification.id
    json.participant_id notification.participant_id
    json.notification notification.notification
    json.message notification.message
    json.thumb image_url(notification.notifiable.topic.challenge,:thumb)
    json.link new_topic_discussion_path(notification.notifiable.topic)
  end
end

json.next_page @notifications.next_page

json.new_notification_count @new_notification_count
