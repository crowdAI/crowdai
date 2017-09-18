class EmailDigestJob < ApplicationJob
  queue_as :digest

  def perform(digest_params)
    digest_type = digest_params['digest_type']
    Rails.logger.info("[EmailDigestJob] digest_params #{digest_params}")

    if digest_type == 'daily'
      Rails.logger.info("[EmailDigestJob] processing DAILY")
      daily_digest_participant_ids.each do |participant_id|
        Rails.logger.info("[EmailDigestJob] processing #{participant_id}")
        EmailDigestMailer.new.sendmail(participant_id,'daily')
      end
    end
    if digest_type == 'weekly'
      Rails.logger.info("[EmailDigestJob] processing WEEKLY")
      weekly_digest_participant_ids.each do |participant_id|
        Rails.logger.info("[EmailDigestJob] processing #{participant_id}")
        EmailDigestMailer.new.sendmail(participant_id,'weekly')
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
