class GdprExportJob < ApplicationJob
  queue_as :default

  def perform(participant_id:)
    GdprExportMailer.new.sendmail(participant_id: participant_id)
  end
end
