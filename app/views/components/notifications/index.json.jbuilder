json.notifications do |json|
  json.array! @notifications do |notification|
    json.id notification.id
    json.participant_id notification.participant_id
    json.notification notification.notification
  end
end

json.next_page @notifications.next_page

json.new_notification_count @new_notification_count
