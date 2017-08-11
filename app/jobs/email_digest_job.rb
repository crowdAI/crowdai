class EmailDigestJob < ApplicationJob
  queue_as :digest

  def perform(digest_type)
    logger.info "starting EmailDigestJob"
    if digest_type == 'daily'
      daily_digest_participant_ids.each do |participant_id|
        logger.info "Sending Daily digest for participant: #{participant_id}"
        #EmailDigestMailer.new.sendmail(participant_id,'daily')
      end
    end
    if digest_type == 'weekly'
      weekly_digest_participant_ids.each do |participant_id|
        logger.info "Sending Weekly digest participant: #{participant_id}"
        #EmailDigestMailer.new.sendmail(participant_id,'weekly')
      end
    end
  end

  def daily_digest_participant_ids
    EmailPreference.where(receive_daily_digest: true)
  end

  def weekly_digest_participant_ids
    EmailPreference.where(receive_weekly_digest: true)
  end

end
