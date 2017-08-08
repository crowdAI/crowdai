class Admin::OrganizerApplicationNotificationJob < ApplicationJob

  def perform(organizer_application)
    admin_ids.each do |participant_id|
      email_preference = EmailPreference.where(participant_id: participant_id).first
      if email_preference.receive_every_email
        Admin::OrganizerApplicationNotificationMailer.new.sendmail(participant_id, organizer_application)
      end
    end
  end

end
