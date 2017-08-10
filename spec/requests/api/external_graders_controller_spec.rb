require 'rails_helper'

RSpec.describe Api::ExternalGradersController, type: :request do
  let(:organizer) { create :organizer }
  let(:challenge) { create :challenge, :running, organizer: organizer, api_key: '3d1efc2332200314c86d2921dd33434c' }
  let(:participant) { create :participant, api_key: '5762b9423a01f72662264358f071908c' }

  describe "GET /api/external_graders/:api_key : validate user API key" do
    context "with valid key" do
      before { xhr :get, "/api/external_graders/#{participant.api_key}", nil, 'Accept': 'application/vnd.api+json', 'Content-Type': 'application/vnd.api+json', 'Authorization': auth_header(challenge.api_key) }
      it { expect(response).to have_http_status(200) }
      it { expect(response.body).to eq('{"message":"Developer API key is valid"}') }
    end

    context "with invalid key" do
      before { xhr :get, "/api/external_graders/264358f071908c5762b9423a01f72662", nil, 'Accept': 'application/vnd.api+json', 'Content-Type': 'application/vnd.api+json', 'Authorization': auth_header(challenge.api_key) }
      it { expect(response).to have_http_status(404) }
      it { expect(response.body).to eq('{"message":"No participant could be found for this API key"}') }
    end

    context "with missing key" do
      before { xhr :get, "/api/external_graders", nil, 'Accept': 'application/vnd.api+json', 'Content-Type': 'application/vnd.api+json', 'Authorization': auth_header(challenge.api_key) }
      it { expect(response).to have_http_status(404) }
    end
  end


  describe "POST /api/external_graders/ : create submission" do
    def valid_attributes
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        score_secondary: 0.999222,
        comment: "My first submission!",
        media_large: '/s3 url',
        media_thumbnail: '/s3_thumbail',
        media_content_type: 'application/png'
      }
    end

    def invalid_api_key
      { challenge_client_name: challenge.challenge_client_name,
        api_key: '264358f071908c5762b9423a01f72662',
        grading_status: 'graded',
        score: 0.9763,
        score_secondary: 0.999222,
        comment: "My first submission!",
        media_large: '/s3 url',
        media_thumbnail: '/s3_thumbail',
        media_content_type: 'application/png'
      }
    end

    def invalid_challenge_client_name
      { challenge_client_name: 'Thisisplainwrong',
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        score_secondary: 0.999222,
        comment: "My first submission!",
        media_large: '/s3 url',
        media_thumbnail: '/s3_thumbail',
        media_content_type: 'application/png'
      }
    end

    def invalid_grading_status
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'pending',
        score: 0.9763,
        score_secondary: 0.999222,
        comment: "My first submission!",
        media_large: '/s3 url',
        media_thumbnail: '/s3_thumbail',
        media_content_type: 'application/png'
      }
    end

    context "with valid attributes" do
      before { xhr :post, '/api/external_graders/', valid_attributes, 'Authorization': auth_header(challenge.api_key) }
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
    end

    context "with invalid developer API key" do
      before { xhr :post, '/api/external_graders/', invalid_api_key, 'Authorization': auth_header(challenge.api_key) }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The API key did not match any participant record.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
    end

    # TODO not implemented
    context "with invalid host API key" do
      before { xhr :post, '/api/external_graders/', valid_attributes, 'Authorization': auth_header(participant.api_key) }
      it { expect(response).to have_http_status(401) }
    end

    context "with invalid Challenge Client Name" do
      before { xhr :post, '/api/external_graders/', invalid_challenge_client_name, 'Authorization': auth_header(challenge.api_key) }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The Challenge Client Name string did not match any challenge.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
    end

    context "with invalid grading status" do
      before { xhr :post, '/api/external_graders/', invalid_grading_status, 'Authorization': auth_header(challenge.api_key) }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The Challenge Client Name string did not match any challenge.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
    end

    context 'participant has made their daily limit of submissions' do
      before do
        6.times {  xhr :post, '/api/external_graders/', valid_attributes, 'Authorization': auth_header(challenge.api_key) }
      end
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The participant has no submission slots remaining for today.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
    end
  end

  describe "GET /api/external_graders/challenge_config : retrieve challenge configuration" do
    context "with valid challenge_client_name" do
      before { xhr :get, "/api/external_graders/challenge_config", { challenge_client_name: challenge.challenge_client_name }, 'Accept': 'application/vnd.api+json', 'Content-Type': 'application/vnd.api+json', 'Authorization': auth_header(challenge.api_key) }
      it { expect(response).to have_http_status(200) }
      it { expect(json(response.body)[:message]).to eq("Configuration for #{challenge.challenge_client_name}") }
    end

    context "with valid challenge_client_name" do
      before { xhr :get, "/api/external_graders/challenge_config", { challenge_client_name: 'incorrectname' }, 'Accept': 'application/vnd.api+json', 'Content-Type': 'application/vnd.api+json', 'Authorization': auth_header(challenge.api_key) }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The Challenge Client Name string did not match any challenge.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
    end
  end

end
