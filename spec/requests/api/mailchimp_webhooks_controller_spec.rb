require 'rails_helper'

RSpec.describe Api::MailchimpWebhooksController, type: :request do
  let(:participant) { create :participant }
  let(:email_preference) { create :email_preference, participant: participant }

  describe "GET show" do
    #before { xhr :get, "/api/mailchimp_webhooks" }
    #it { expect(response).to have_http_status(200) }
  end

  describe "POST create" do
    #before { xhr :post, "/api/mailchimp_webhooks" }
    #it { expect(response).to have_http_status(200) }
  end
end
