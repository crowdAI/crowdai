class MailchimpService

  def initialize(participant_id)
    @participant = Participant.find(participant_id)
  end

  def subscribed?
    return false if member.nil?
    status = member['status']
    if status == 'subscribed'
      return true
    else
      return false
    end
  end

  def member
    begin
      return gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members(lower_case_md5_hashed_email_address).retrieve.body
    rescue
      return nil
    end
  end

  def subscribe
    lower_case_md5_hashed_email_address = Digest::MD5.hexdigest(@participant.email.downcase)
    begin
      gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
      resp = gibbon.lists(ENV['MAILCHIMP_LIST_ID'])
                   .members(lower_case_md5_hashed_email_address)
                   .upsert(body:
                            {email_address: @participant.email,
                            status: 'subscribed',
                            merge_fields: { FNAME: @participant.name }})
      Rails.logger.info("[MailchimpService] #subscribe API response: #{resp.inspect}")
    rescue Exception => e
      if e.message =~ /ooks fake or invalid, please enter a real email address/
        participant.disable_account('MailChimp rejected email as a fake address')
      end
    end
  end

  def unsubscribe
    begin
      resp = gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members(lower_case_md5_hashed_email_address).update(body: { status: "unsubscribed" })
      Rails.logger.info("[MailchimpService] #unsubscribe API response: #{resp.inspect}")
    rescue Exception => e
      Rails.logger.info("[MailchimpService] #unsubscribe API exception: #{e.message}")
    end
  end

  def lower_case_md5_hashed_email_address
    Digest::MD5.hexdigest(@participant.email.downcase)
  end

  def gibbon
    @gibbon ||= Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
  end

end
