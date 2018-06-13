class SubmissionGradedNotificationJob < ApplicationJob
  queue_as :default

  def perform(submission)
    recipient_ids(submission).each do |participant_id|
      email_preference = EmailPreference.where(participant_id: participant_id).first
      if email_preference.email_frequency == :every
        SubmissionGradedNotificationMailer.new.sendmail(submission.participant_id, submission.id)
      end
    end
  end

  def recipient_ids(submission)
    ids = [submission.participant_id].concat(admin_ids)
    ids.uniq
  end

  def admin_ids
    Participant.where(admin: true).pluck(:id)
  end

end
