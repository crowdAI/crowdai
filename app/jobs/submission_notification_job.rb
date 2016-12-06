class SubmissionNotificationJob < BaseJob
  queue_as :default

  def perform(submission)
    admin_ids.each do |admin_id|
      SubmissionNotificationMailer.sendmail(admin_id, submission.id).deliver_now
    end
  end

  def admin_ids
    Participant.where(admin: true).pluck(:id)
  end

end
