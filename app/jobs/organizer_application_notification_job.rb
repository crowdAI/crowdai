class OrganizerApplicationNotificationJob < ApplicationJob
  queue_as :default

  def perform(organizer_application)
    OrganizerApplicationNotificationMailer.new.sendmail(organizer_application)
  end

end
