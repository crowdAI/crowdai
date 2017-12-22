class Notification < ApplicationRecord
  belongs_to :participant
  belongs_to :notifiable, polymorphic: true

  scope :pristine, -> { where(is_new: true) }
  scope :recent, -> { order(created_at: :desc) }
  scope :unread, -> { where(read_at: nil) }

  def read?
    self.read_at.present?
  end

  def link
    details[:link]
  end

  def thumb
    details[:thumb]
  end

  def message
    details[:message]
  end

  def details
    @details ||= begin
      notifiable = self.notifiable
      case self.notification
      when 'comment'
        message = "#{notifiable.participant.name} commented on a discussion thread you are participating in."
        thumb = image_url(notifiable.participant,:thumb)
        link = new_topic_discussion_path(notifiable.topic)
      when 'mention'
        message = "#{notifiable.participant.name} mentioned you in a post."
        thumb = image_url(notifiable.participant,:thumb)
        link = new_topic_discussion_path(notifiable.topic)
      when 'graded'
        message = "Your Learning how to walk submission has been graded with a score of 1233"
        thumb = image_url(notifiable.challenge,:thumb)
        link = challenge_url(notifiable.challenge)
      when 'grading_failed'
        messsage = "Your Learning how to walk submission has failed grading"
        thumb = image_url(notifiable.challenge,:thumb)
        link = challenge_url(notifiable.challenge)
      when 'leaderboard'
        message = "You moved from 3rd to 5th place on the Learning how to walk leaderboard"
        thumb = image_url(notifiable.challenge,:thumb)
        link = challenge_url(notifiable.challenge)
      end
      details = { message: message, thumb: thumb, link: link }
    end
  end

end
