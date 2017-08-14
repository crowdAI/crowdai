class Admin::SubmissionNotificationJob < ApplicationJob

  def perform(submission)
    Rails.logger.info "Admin::SubmissionNotificationJob admin_ids: #{admin_ids}"
    admin_ids.each do |admin_id|
      email_preference = EmailPreference.where(participant_id: admin_id).first
      if email_preference.receive_every_email
        Rails.logger.info "Admin::SubmissionNotificationJob mailing #{admin_id}"
        Admin::SubmissionNotificationMailer.new.sendmail(admin_id, submission.id)
      end
    end
  end

end
