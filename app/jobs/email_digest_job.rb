class EmailDigestJob < ApplicationJob

  def perform(digest_type)
    if digest_type == 'daily'
      daily_digest_participant_ids.each do |participant_id|
        EmailDigestMailer.new.sendmail(participant_id,'daily')
      end
    end
    if digest_type = 'weekly'
      weekly_digest_participant_ids.each do |participant_id|
        EmailDigestMailer.new.sendmail(participant_id,'weekly')
      end
    end
  end

  def daily_digest_participant_ids
    [1,2,3]
  end

  def weekly_digest_participant_ids
    [1,2,3]
  end

end
