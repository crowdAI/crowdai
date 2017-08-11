class EmailDigestJob < ApplicationJob
  queue_as :digest

  def perform(digest_type)
    Rails.logger.info "EmailDigestJob: digest_type: #{digest_type}"
    if digest_type == 'daily'
      Rails.logger.info 'EmailDigestJob: running daily'
      Rails.logger.info daily_digest_participant_ids
      daily_digest_participant_ids.each do |participant_id|
        Rails.logger.info "EmailDigestJob: Sending Daily digest for participant: #{participant_id}"
        #EmailDigestMailer.new.sendmail(participant_id,'daily')
      end
    end
    if digest_type == 'weekly'
      weekly_digest_participant_ids.each do |participant_id|
        Rails.logger.info "EmailDigestJob: Sending Weekly digest participant: #{participant_id}"
        #EmailDigestMailer.new.sendmail(participant_id,'weekly')
      end
    end
  end

  def daily_digest_participant_ids
    EmailPreference.where(receive_daily_digest: true).ids
  end

  def weekly_digest_participant_ids
    EmailPreference.where(receive_weekly_digest: true).ids
  end

end
