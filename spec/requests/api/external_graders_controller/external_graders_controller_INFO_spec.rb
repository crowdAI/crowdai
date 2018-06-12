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


  # SUBMISSION INFO
  describe "GET /api/external_graders/:submission_id/submission_info : Submission Info" do
    context "with valid organizer auth key" do
      before {
        get "/api/external_graders/#{submission1.id}/submission_info",
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header(organizer.api_key)
          }
        }
      it { expect(response).to have_http_status(200) }
      it { expect(json(response.body)[:message]).to eq('Submission details found.') }
      it { expect(json(response.body)[:score]).to eq(submission1.score) }
    end

    context "with invalid developer API key" do
      before {
        get "/api/external_graders/#{SecureRandom.uuid}/presign/",
            headers: {
              'Accept': 'application/vnd.api+json',
              'Content-Type': 'application/vnd.api+json'
            }
        }
      it { expect(response).to have_http_status(404) }
      it { expect(json(response.body)[:message]).to eq('No participant could be found for this API key') }
      it { expect(json(response.body)[:id]).to be_nil }
      end
  end

  Timecop.return
end
