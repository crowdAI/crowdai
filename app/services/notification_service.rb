class NotificationService
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::AssetTagHelper

  def initialize(participant_id, notifiable, notification_type)
    @participant = Participant.find(participant_id)
    @notifiable = notifiable
    @notification_type = notification_type
  end

  def call
    eval(@notification_type)
  end

  def comment
    message = "#{@notifiable.participant.name} commented on a discussion thread you are participating in."
    if @notifiable.participant.image_file.file.present?
      thumbnail_url = @notifiable.participant.image_file.url
    else
      thumbnail_url = 'users/avatar-default.png'
    end
    notification_url = new_topic_discussion_url(@notifiable.topic)
    Notification
      .create!(
        participant: @participant,
        notifiable: @notifiable,
        notification_type: @notification_type,
        message: message,
        thumbnail_url: thumbnail_url,
        notification_url: notification_url,
        is_new: true)
    return true
  end

  def topic
    message = "#{@notifiable.participant.name} posted a topic in a challenge you are following."
    if @notifiable.participant.image_file.file.present?
      thumbnail_url = @notifiable.participant.image_file.url
    else
      thumbnail_url = 'users/avatar-default.png'
    end
    notification_url = new_topic_discussion_url(@notifiable.topic)
    Notification
      .create!(
        participant: @participant,
        notifiable: @notifiable,
        notification_type: @notification_type,
        message: message,
        thumbnail_url: thumbnail_url,
        notification_url: notification_url,
        is_new: true)
    return true
  end

  def mention
    message = "#{@notifiable.participant.name} mentioned you in a post."
    if @notifiable.participant.image_file.file.present?
      thumbnail_url = @notifiable.participant.image_file.url
    else
      thumbnail_url = 'users/avatar-default.png'
    end
    notification_url = new_topic_discussion_url(@notifiable.topic)
    Notification
      .create!(
        participant: @participant,
        notifiable: @notifiable,
        notification_type: @notification_type,
        message: message,
        thumbnail_url: thumbnail_url,
        notification_url: notification_url,
        is_new: true)
    return true
  end

  def graded
    message = "Your Learning how to walk submission has been graded with a score of 1233"
    thumb = image_url(@notifiable.challenge)
    link = challenge_url(@notifiable.challenge)
  end

  def grading_failed
    messsage = "Your Learning how to walk submission has failed grading"
    thumb = image_url(@notifiable.challenge)
    link = challenge_url(@notifiable.challenge)
  end

  def leaderboard
    message = "You moved from 3rd to 5th place on the Learning how to walk leaderboard"
    thumb = image_url(@notifiable.challenge)
    link = challenge_url(@notifiable.challenge)
  end

  def article
    message = 'A new article has been drafted'
    thumb = image_url(@notifiable.challenge)
    link = challenge_url(@notifiable.challenge)
  end

end
