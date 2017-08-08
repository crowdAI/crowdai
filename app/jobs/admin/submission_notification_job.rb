class Admin::SubmissionNotificationJob < ApplicationJob

  def perform(submission)
    admin_ids.each do |admin_id|
      Admin::SubmissionNotificationMailer.new.sendmail(admin_id, submission.id)
    end
  end

end
