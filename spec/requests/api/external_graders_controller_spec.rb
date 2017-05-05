require 'rails_helper'

RSpec.describe Api::ExternalGradersController, type: :request do
  let(:organizer) { create :organizer, api_key: '3d1efc2332200314c86d2921dd33434c' }
  let(:challenge) { create :challenge, :running, organizer: organizer }
  let(:participant) { create :participant, api_key: '5762b9423a01f72662264358f071908c' }

  describe "GET #show : validate user API key" do
    context "with valid key" do
      before { xhr :get, "/api/external_graders/#{participant.api_key}", nil, 'Accept': 'application/vnd.api+json', 'Content-Type': 'application/vnd.api+json', 'Authorization': auth_header(organizer.api_key) }
      it { expect(response).to have_http_status(200) }
      it { expect(response.body).to eq('{"message":"Developer API key is valid"}') }
      it { expect(response.content_type).to eq Mime[:json] }
    end

    context "with invalid key" do
      before { xhr :get, "/api/external_graders/264358f071908c5762b9423a01f72662", nil, 'Accept': 'application/vnd.api+json', 'Content-Type': 'application/vnd.api+json', 'Authorization': auth_header(organizer.api_key) }
      it { expect(response).to have_http_status(404) }
      it { expect(response.body).to eq('{"message":"No participant could be found for this API key"}') }
      it { expect(response.content_type).to eq Mime[:json] }
    end

    context "with missing key" do
      before { xhr :get, "/api/external_graders", nil, 'Accept': 'application/vnd.api+json', 'Content-Type': 'application/vnd.api+json', 'Authorization': auth_header(organizer.api_key) }
      it { puts response.body }
      it { expect(response).to have_http_status(404) }
    end
  end

  describe "POST #create : create submission" do
    context "with valid params" do
      def params
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

      before do
        xhr :post, "/api/external_graders", params, 'Accept': 'application/vnd.api+json', 'Content-Type': 'application/vnd.api+json', 'Authorization': auth_header(organizer.api_key)
      end
      it { puts params }
      it { puts participant.inspect }
      it { expect(response).to have_http_status(200) }
      it { expect(response.body).to eq('{"message":"Developer API key is valid"}') }
      #it { expect(response.content_type).to eq Mime[:json] }
    end

    context "with invalid developer API key" do

    end

    context "with invalid host API key" do

    end

    context "with invalid Challenge Client Name" do

    end

    context "with invalid grading status" do

    end
  end
end
