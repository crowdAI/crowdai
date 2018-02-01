class Admin::ChallengeCallResponseNotificationJob < ApplicationJob

  def perform(challenge_call_response)
    admin_ids.each do |admin_id|
      Admin::ChallengeCallResponseNotificationMailer.new
          .sendmail(admin_id, challenge_call_response)
    end
  end

end
