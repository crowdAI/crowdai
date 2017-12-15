json.new_notification_count @new_notification_count
json.next_page @notifications.next_page
json.notifications do |json|
  json.array! @notifications do |n|
    json.id n.id
    json.actor n.initiating_user.display_name
    json.initiating_user_image_url n.initiating_user.image.url
    json.action n.notification_type_cd
    json.url case n.notifiable.class.to_s
               when "Appointment" then appointment_path(n.notifiable_id)
               when "User" then user_path(n.initiating_user_id)
             end
    json.time_ago time_ago_in_words(n.created_at) + " ago"
    json.unread n.read_at.nil?
  end
end
