class Admin::SubmissionNotificationJob < ApplicationJob

  def perform(submission)
    admin_ids.each do |participant_id|
      email_preference = EmailPreference.where(participant_id: participant_id).first
      if email_preference.receive_every_email
        Admin::SubmissionNotificationMailer.new.sendmail(admin_id, submission.id)
      end
    end
  end

end
