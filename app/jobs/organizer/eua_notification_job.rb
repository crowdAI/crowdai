class Organizer::EuaNotificationJob < ApplicationJob

  def perform(clef_task_id,participant_id)
    clef_task = ClefTask.find(clef_task_id)
    organizer_ids(clef_task).each do |organizer_participant_id|
      Organizer::EuaNotificationMailer.new
          .sendmail(organizer_participant_id, clef_task_id, participant_id)
    end
  end

  def organizer_ids(clef_task)
    clef_task.organizer.participants.where(clef_email: true).ids
  end

end
