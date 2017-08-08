class ApplicationJob < ActiveJob::Base
  queue_as :default

  def admin_ids
    Participant.where(admin: true).pluck(:id)
  end
end
