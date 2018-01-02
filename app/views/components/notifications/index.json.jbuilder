json.next_page @notifications.next_page
json.new_notification_count @new_notification_count
json.current_participant_id current_participant.id
json.notifications do |json|
  json.array! @notifications do |notification|
    json.id notification.id
    json.notification_url notification.notification_url
    json.thumbnail_url image_path notification.thumbnail_url
    json.message notification.message
  end
end
