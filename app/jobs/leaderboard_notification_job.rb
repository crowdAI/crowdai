class LeaderboardNotificationJob < BaseJob
  queue_as :default

  def perform(submission)
    subscribed_participant_ids.each do |participant_id|
      LeaderboardNotificationMailer.new.sendmail(participant_id, submission.id)
    end
  end


  def subscribed_participant_ids(submission)
    ids = admin_ids.concat(challenge_participant_ids(post)).concat(all_participants)
    ids.uniq
  end


  def admin_ids
    Participant.where(admin: true).pluck(:id)
  end


  def challenge_participant_ids(submission)
    ParticipantChallenge
        .joins("LEFT JOIN email_preferences on participant_challenges.participant_id = email_preferences.participant_id")
        .where(participant_challenges: { challenge_id: submission.challenge_id }, email_preferences: { my_leaderboard: true })
        .pluck(:participant_id)
  end


  def all_participants
     Participant
        .joins(:email_preferences)
        .where(email_preferences: { any_leaderboard: true })
        .pluck(:participant_id)
  end

end
