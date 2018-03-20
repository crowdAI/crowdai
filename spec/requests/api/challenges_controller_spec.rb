require 'rails_helper'

RSpec.describe Api::ChallengesController, type: :request do
  let!(:day) { create :challenge, :day }
  let!(:week) { create :challenge, :week }
  let!(:previous_round) { create :challenge, :previous_round }
  let!(:valid_key) { ENV['CROWDAI_API_KEY']}
  let!(:invalid_key) { '123dfdfobdsfnkbndskndsraslv' }

  describe "GET #index" do
    context 'invalid API key' do
      before {
        get "/api/challenges",
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header(invalid_key) } }
        it { expect(response).to have_http_status(401) }
        it { expect(response.body).to eq("HTTP Token: Access denied.\n") }
    end
  end

  describe "GET #show" do
    context 'invalid API key' do
      before {
        get "/api/challenges/#{day.id}",
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header(invalid_key) } }
        it { expect(response).to have_http_status(401) }
        it { expect(response.body).to eq("HTTP Token: Access denied.\n") }
    end

    context 'single round' do
      before {
        get "/api/challenges/#{week.id}",
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header(valid_key) } }
        it { expect(response).to have_http_status(200) }
        it { expect(response.body).not_to be_nil }
    end

    context 'multi round' do
      before {
        get "/api/challenges/#{previous_round.id}",
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header(valid_key) } }
        it { expect(response).to have_http_status(200) }
        it { expect(response.body).not_to be_nil }
    end
  end

end
