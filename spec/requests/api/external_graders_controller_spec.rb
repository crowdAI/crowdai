require 'rails_helper'

RSpec.describe Api::ExternalGradersController, type: :request do
  Timecop.freeze
  let!(:organizer) { create :organizer, api_key: '3d1efc2332200314c86d2921dd33434c' }
  let!(:challenge) { create :challenge, :running, organizer: organizer }
  let!(:participant) { create :participant, api_key: '5762b9423a01f72662264358f071908c' }
  let!(:submission1) { create :submission, challenge: challenge, participant: participant, created_at: 2.hours.ago }
  let!(:submission2) { create :submission, challenge: challenge, participant: participant, created_at: 18.hours.ago }
  let!(:submission3) { create :submission, challenge: challenge, participant: participant, created_at: 2.days.ago }

  def valid_attributes
    { challenge_client_name: challenge.challenge_client_name,
      api_key: participant.api_key,
      grading_status: 'graded',
      score: 0.9763
    }
  end

  def valid_attributes_failed_grading
    { challenge_client_name: challenge.challenge_client_name,
      api_key: participant.api_key,
      grading_status: 'failed',
      grading_message: 'grading failed',
      score: 0.9763
    }
  end

  def valid_attributes_with_secondary_score
    { challenge_client_name: challenge.challenge_client_name,
      api_key: participant.api_key,
      grading_status: 'graded',
      score: 0.9763,
      score_secondary: 0.999222
    }
  end

  def valid_attributes_with_comment
    { challenge_client_name: challenge.challenge_client_name,
      api_key: participant.api_key,
      grading_status: 'graded',
      score: 0.9763,
      comment: "**My first submission!**"
    }
  end

  def valid_attributes_with_media
    { challenge_client_name: challenge.challenge_client_name,
      api_key: participant.api_key,
      grading_status: 'graded',
      score: 0.9763,
      media_large: '/s3 url',
      media_thumbnail: '/s3_thumbail',
      media_content_type: 'application/png'
    }
  end

  def invalid_api_key_attributes
    { challenge_client_name: challenge.challenge_client_name,
      api_key: '264358f071908c5762b9423a01f72662',
      grading_status: 'graded',
      score: 0.9763
    }
  end

  def invalid_challenge_client_name_attributes
    { challenge_client_name: 'Thisisplainwrong',
      api_key: participant.api_key,
      grading_status: 'graded',
      score: 0.9763
    }
  end

  def invalid_grading_status_attributes
    { challenge_client_name: challenge.challenge_client_name,
      api_key: participant.api_key,
      grading_status: 'pending',
      score: 0.9763
    }
  end

  def invalid_missing_score_attributes
    { challenge_client_name: challenge.challenge_client_name,
      api_key: participant.api_key,
      grading_status: 'graded',
      score: nil
    }
  end

  def invalid_attributes_failed_grading
    { challenge_client_name: challenge.challenge_client_name,
      api_key: participant.api_key,
      grading_status: 'failed',
      grading_message: nil,
      score: 0.9763
    }
  end

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

    context 'team API key validation' do

    end

  end


  describe "POST /api/external_graders/ : create submission" do
    context "with valid_attributes" do
      before {
        post '/api/external_graders/',
          params: valid_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.participant_id).to eq(participant.id)}
      it { expect(Submission.last.score).to eq(valid_attributes_with_secondary_score[:score])}
      it { expect(Submission.last.grading_status_cd).to eq('graded')}
    end

    context "with valid_attributes_failed_grading" do
      before {
        post '/api/external_graders/',
          params: valid_attributes_failed_grading,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.participant_id).to eq(participant.id)}
      it { expect(Submission.last.score).to eq(nil)}
      it { expect(Submission.last.grading_status_cd).to eq('failed')}
      it { expect(Submission.last.grading_message).to eq(valid_attributes_failed_grading[:grading_message])}
    end

    context "with valid_attributes_with_secondary_score" do
      before {
        post '/api/external_graders/',
          params: valid_attributes_with_secondary_score,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.score_secondary).to eq(valid_attributes_with_secondary_score[:score_secondary])}
    end

    context "with valid_attributes_with_comment" do
      before {
        post '/api/external_graders/',
          params: valid_attributes_with_comment,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.grading_message).to eq('123')}
    end

    context "with valid_attributes_with_media" do
      before {
        post '/api/external_graders/',
          params: valid_attributes_with_media,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.media_large).to eq(valid_attributes_with_media[:media_large])}
      it { expect(Submission.last.media_thumbnail).to eq(valid_attributes_with_media[:media_thumbnail])}
      it { expect(Submission.last.media_content_type).to eq(valid_attributes_with_media[:media_content_type])}
    end

    context "with invalid developer API key" do
      before {
        post '/api/external_graders/',
        params: invalid_api_key_attributes,
        headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The API key did not match any participant record.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
    end

    context "with invalid Challenge Client Name" do
      before {
        post '/api/external_graders/',
          params: invalid_challenge_client_name_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(401) }
      it { expect(response.body).to eq("HTTP Token: Access denied.\n") }
    end

    context "with invalid grading status" do
      before {
        post '/api/external_graders/',
          params: invalid_grading_status_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The Challenge Client Name string did not match any challenge.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
    end

    context 'participant has made their daily limit of submissions' do
      before do
        6.times {
          post '/api/external_graders/',
          params: valid_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      end
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The participant has no submission slots remaining for today.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
    end
  end

  describe "GET /api/external_graders/challenge_config : retrieve challenge configuration" do
    context "with valid challenge_client_name" do
      before {
        get "/api/external_graders/challenge_config",
        params: { challenge_client_name: challenge.challenge_client_name },
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(200) }
      it { expect(json(response.body)[:message]).to eq("Configuration for #{challenge.challenge_client_name}") }
    end

    context "with valid challenge_client_name" do
      before {
        get "/api/external_graders/challenge_config",
          params: { challenge_client_name: 'incorrectname' },
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The Challenge Client Name string did not match any challenge.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
    end
  end

end
