class AddToMailChimpListJob < ActiveJob::Base
  queue_as :default

  def perform(participant_id)
    if Rails.env.production?
      participant = Participant.find(participant_id)
      gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
      gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create(body: {email_address: p.email,
                                                                   status: 'subscribed',
                                                                   merge_fields: {FNAME: p.name }})
    end
  end
end
