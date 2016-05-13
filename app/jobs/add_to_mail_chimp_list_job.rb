class AddToMailChimpListJob < ActiveJob::Base
  queue_as :default

  def perform(participant_id)
    if Rails.env.production?
      participant = Participant.find(participant_id)
      CHIMP.lists.subscribe(ENV['MAILCHIMP_LIST_ID'], { email: user.email }, { "NAME" => user.name }, 'html', false)
    end
  end
end
