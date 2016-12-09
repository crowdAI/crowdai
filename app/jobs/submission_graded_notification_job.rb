class SubmissionGradedNotificationJob < BaseJob
  queue_as :default

  def perform(submission)
    recipient_ids(submission).each do |participant_id|
      SubmissionGradedNotificationMailer.sendmail(submission.participant_id, submission.id).deliver_now
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
