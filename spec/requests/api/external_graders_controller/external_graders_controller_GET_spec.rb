require 'rails_helper'

RSpec.describe Api::ExternalGradersController, type: :request do

  before do
    Timecop.freeze(DateTime.new(2017, 10, 30, 2, 2, 2, "+02:00"))
  end

  after do
    Timecop.return
  end

  let!(:organizer) { create :organizer, api_key: '3d1efc2332200314c86d2921dd33434c' }
  let!(:challenge) {
    create :challenge,
      :running,
      organizer: organizer }
  let!(:challenge_round) { create :challenge_round,
                                  challenge_id: challenge.id,
                                  start_dttm: 4.weeks.ago,
                                  end_dttm: 4.weeks.since }
  let!(:participant) { create :participant, api_key: '5762b9423a01f72662264358f071908c' }
  let!(:submission1) { create :submission, challenge: challenge, participant: participant, created_at: 2.hours.ago }
  let!(:submission2) { create :submission, challenge: challenge, participant: participant, created_at: 18.hours.ago }
  let!(:submission3) { create :submission, challenge: challenge, participant: participant, created_at: 2.days.ago }


  describe "GET /api/external_graders/:api_key : validate user API key" do
    context 'individual developer API key validation' do
      describe "with valid organizer auth key" do
        before {
          get "/api/external_graders/#{participant.api_key}",
            headers: {
              'Accept': 'application/vnd.api+json',
              'Content-Type': 'application/vnd.api+json',
              'Authorization': auth_header(organizer.api_key) } }
        it { expect(response).to have_http_status(200) }
        it { expect(response.body).to eq('{"message":"Developer API key is valid","participant_id":' + participant.id.to_s + '}') }
      end

      describe "with crowdAI auth key" do
        before {
          get "/api/external_graders/#{participant.api_key}",
            headers: {
              'Accept': 'application/vnd.api+json',
              'Content-Type': 'application/vnd.api+json',
              'Authorization': auth_header(ENV['CROWDAI_API_KEY']) } }
        it { expect(response).to have_http_status(200) }
        it { expect(response.body).to eq('{"message":"Developer API key is valid","participant_id":' + participant.id.to_s + '}') }
      end

      describe "with invalid auth key" do
        before {
          get "/api/external_graders/#{participant.api_key}",
            headers: {
              'Accept': 'application/vnd.api+json',
              'Content-Type': 'application/vnd.api+json',
              'Authorization': auth_header('8f071908c5762b94dsc23a0a2e3asdesd1f726') } }
        it { expect(response).to have_http_status(401) }
        it { expect(response.body).to eq("HTTP Token: Access denied.\n") }
      end

      describe "with invalid developer key" do
        before {
          get "/api/external_graders/264358f071908c5762b9423a01f72662",
            headers: {
              'Accept': 'application/vnd.api+json',
              'Content-Type': 'application/vnd.api+json',
              'Authorization': auth_header(organizer.api_key) } }
        it { expect(response).to have_http_status(404) }
        it { expect(response.body).to eq('{"message":"No participant could be found for this API key","participant_id":null}') }
      end
    end
  end

  Timecop.return
end
