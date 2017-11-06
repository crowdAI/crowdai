class ChallengeRegistrationService

  def call(registration_type,participant_id,challenge_id)
    challenge_registration = find_or_create_challenge_registration(participant_id,challenge_id)
    case registration_type
    when 'heart'
      challenge_registration.update(hearted: true)
    when 'forum'
      challenge_registration.update(forum: true)
    when 'submission'
      challenge_registration.update(submitted: true)
    when 'dataset_download'
      challenge_registration.update(dataset_downloaded: true)
    end
  end

  def find_or_create_challenge_registration(participant_id,challenge_id)
    challenge_registration = ChallengeRegistration.where(participant_id: participant_id, challenge_id: challenge_id).first
    if challenge_registration.nil?
      Rails.logger.debug("participant_id: #{participant_id},challenge_id: #{challenge_id}")
      challenge_registration = ChallengeRegistration.create!(participant_id: participant_id, challenge_id: challenge_id)
    end
    return challenge_registration
  end

  def recount!
    ParticipantChallengeCount.all.each do |row|
      puts row.inspect
      participant_id = row.participant_id
      challenge_id = row.challenge_id
      call(row.registration_type,participant_id,challenge_id)
    end
  end

end
