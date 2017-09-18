require 'rails_helper'

RSpec.describe Api::MailchimpsController, type: :request do
  let!(:participant) { create :participant }
  let!(:email_preference) { create :email_preference, participant: participant }

  def valid_unsubscribe_params
    {
      "type": "unsubscribe",
      "fired_at": "2009-03-26 21:40:57",
      "data[action]": "unsub",
      "data[reason]": "manual",
      "data[id]": "8a25ff1d98",
      "data[list_id]": ENV['MAILCHIMP_LIST_ID'],
      "data[email]": participant.email,
      "data[email_type]": "html",
      "data[merges][EMAIL]": participant.email,
      "data[merges][FNAME]": "MailChimp",
      "data[merges][LNAME]": "API",
      "data[merges][INTERESTS]": "Group1,Group2",
      "data[ip_opt]": "10.20.10.30",
      "data[campaign_id]": "cb398d21d2",
      "data[reason]": "hard"
    }
  end

  def invalid_unsubscribe_params
    {
      "type": "unsubscribe",
      "fired_at": "2009-03-26 21:40:57",
      "data[action]": "unsub",
      "data[reason]": "manual",
      "data[id]": "8a25ff1d98",
      "data[list_id]": "abcedfg12345",
      "data[email]": "api@mailchimp.com",
      "data[email_type]": "html",
      "data[merges][EMAIL]": "api@mailchimp.com",
      "data[merges][FNAME]": "MailChimp",
      "data[merges][LNAME]": "API",
      "data[merges][INTERESTS]": "Group1,Group2",
      "data[ip_opt]": "10.20.10.30",
      "data[campaign_id]": "cb398d21d2",
      "data[reason]": "hard"
    }
  end

  def valid_subscribe_params
    {
      "type": "subscribe",
      "fired_at": "2009-03-26 21:35:57",
      "data[id]": "8a25ff1d98",
      "data[list_id]": ENV['MAILCHIMP_LIST_ID'],
      "data[email]": participant.email,
      "data[email_type]": "html",
      "data[merges][EMAIL]": participant.email,
      "data[merges][FNAME]": "MailChimp",
      "data[merges][LNAME]": "API",
      "data[merges][INTERESTS]": "Group1,Group2",
      "data[ip_opt]": "10.20.10.30",
      "data[ip_signup]": "10.20.10.30"
    }
  end

  def invalid_subscribe_params
    {
      "type": "subscribe",
      "fired_at": "2009-03-26 21:35:57",
      "data[id]": "8a25ff1d98",
      "data[list_id]": ENV['MAILCHIMP_LIST_ID'],
      "data[email]": "api@mailchimp.com",
      "data[email_type]": "html",
      "data[merges][EMAIL]": "api@mailchimp.com",
      "data[merges][FNAME]": "MailChimp",
      "data[merges][LNAME]": "API",
      "data[merges][INTERESTS]": "Group1,Group2",
      "data[ip_opt]": "10.20.10.30",
      "data[ip_signup]": "10.20.10.30"
    }
  end

  describe "GET webhook" do
    context 'unsubscribe / valid email' do
      #expect {
      #  get '/api/mailchimps/webhook/', params: valid_unsubscribe_params
      #}.to change { EmailPreference.last.newsletter }.to false
      #end
      #it { puts participant.email_preferences.inspect }
      #it { expect(response).to have_http_status(200) }
      #it { expect(EmailPreference.last.newsletter).to be false }
    end

  #  context 'unsubscribe / invalid email' do
  #    before { get '/api/mailchimps/webhook/', params: invalid_unsubscribe_params }
  #    it { expect(response).to have_http_status(200) }
  #    it { expect(EmailPreference.last.newsletter).to be false }
  #  end
  end

end
