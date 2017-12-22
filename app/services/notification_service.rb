class NotificationService

  def initialize(participant_id, notifiable, notification)
    @participant = Participant.find(participant_id)
    @notifiable = notifiable
    @notification = notification
  end

  def call
    eval(@notification)
  end

  def comment
    Notification
      .create!(
        participant: @participant,
        notifiable: @notifiable,
        notification: @notification,
        is_new: true)
  end

  def mention
  end

  def submission
  end

  def leaderboard
  end

end
