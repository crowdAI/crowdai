class Admin::OrganizerApplicationNotificationJob < ApplicationJob

  def perform(organizer_application)
    admin_ids.each do |admin_id|
      email_preference = EmailPreference.where(participant_id: admin_id).first
      if email_preference.receive_every_email
        Admin::OrganizerApplicationNotificationMailer.new.sendmail(admin_id, organizer_application)
      end
    end
  end

end
