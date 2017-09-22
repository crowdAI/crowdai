require 'rails_helper'

RSpec.describe Api::MailchimpsController, type: :request do

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
    }
  end

  describe "POST #webhook" do
    context 'valid API key' do
      let!(:participant) { create :participant, :newsletter_true }

      context 'unsubscribe / valid email' do
        before { post "/api/mailchimps/webhook/?api_key=#{ENV['MAILCHIMP_INBOUND_API_KEY']}", params: valid_unsubscribe_params }
        it { expect(response).to have_http_status(200) }
        it { expect(EmailPreference.last.newsletter).to be false }
      end

      context 'unsubscribe / invalid email' do
        before { post "/api/mailchimps/webhook/?api_key=#{ENV['MAILCHIMP_INBOUND_API_KEY']}", params: invalid_unsubscribe_params }
        it { expect(response).to have_http_status(200) }
        it { expect(EmailPreference.last.newsletter).to be true }
      end
    end

    context 'invalid API key' do
      let!(:participant) { create :participant, :newsletter_true }

      before { post "/api/mailchimps/webhook/?api_key=12345678", params: invalid_unsubscribe_params }
      it { expect(response).to have_http_status(401) }
      it { expect(EmailPreference.last.newsletter).to be true }
    end
  end

  describe "GET #verify" do
    context 'valid API key' do
      before { get "/api/mailchimps/webhook/?api_key=#{ENV['MAILCHIMP_INBOUND_API_KEY']}" }
      it { expect(response).to have_http_status(200) }
    end

    context 'invalid API key' do
      before { get "/api/mailchimps/webhook/?api_key='1242424124'" }
      it { expect(response).to have_http_status(401) }
    end
  end

end
