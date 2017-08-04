class Admin::OrganizerApplicationNotificationJob < BaseJob
  queue_as :default

  def perform(organizer_application)
    admin_ids.each do |admin_id|
      Admin::OrganizerApplicationNotificationMailer.new.sendmail(admin_id, organizer_application)
    end
  end

end
