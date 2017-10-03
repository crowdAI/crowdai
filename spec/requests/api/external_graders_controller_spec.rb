require 'rails_helper'

RSpec.describe Api::ExternalGradersController, type: :request do

  before do
    Timecop.freeze(DateTime.new(2017, 10, 30, 2, 2, 2, "+02:00"))
  end

  let!(:organizer) { create :organizer, api_key: '3d1efc2332200314c86d2921dd33434c' }
  let!(:challenge) { create :challenge,
                            :running,
                            organizer: organizer,
                            daily_submissions: 5,
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


  describe "POST /api/external_graders/ : create submission" do
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

    def invalid_incomplete_with_media_attributes
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        media_large: '/s3 url',
        media_thumbnail: nil,
        media_content_type: 'application/png'
      }
    end

    context "with valid_attributes" do
      before do
        post '/api/external_graders/',
          params: valid_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(json(response.body)[:submissions_remaining]).to eq(3) }
      it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30T06:02:02.000Z") }
      it { expect(Submission.count).to eq(4)}
      it { expect(Submission.last.participant_id).to eq(participant.id)}
      it { expect(Submission.last.score).to eq(valid_attributes_with_secondary_score[:score])}
      it { expect(Submission.last.grading_status_cd).to eq('graded')}
      it { expect(Submission.last.post_challenge).to be false }
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
      it { expect(Submission.last.post_challenge).to be false }
    end

    context "with valid_attributes_with_comment" do
      before {
        post '/api/external_graders/',
          params: valid_attributes_with_comment,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.description).to eq("<p><strong>My first submission!</strong></p>\n")}
      it { expect(Submission.last.post_challenge).to be false }
    end

    context "with valid_attributes_with_media" do
      before do
        post '/api/external_graders/',
          params: valid_attributes_with_media,
          headers: { 'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.media_large).to eq(valid_attributes_with_media[:media_large])}
      it { expect(Submission.last.media_thumbnail).to eq(valid_attributes_with_media[:media_thumbnail])}
      it { expect(Submission.last.media_content_type).to eq(valid_attributes_with_media[:media_content_type])}
      it { expect(Submission.last.post_challenge).to be false }
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

    context "with incomplete Media fields" do
      before {
        post '/api/external_graders/',
          params: invalid_incomplete_with_media_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("Either all or none of media_large, media_thumbnail and media_content_type must be provided.") }
    end

    context "with invalid grading status" do
      before {
        post '/api/external_graders/',
          params: invalid_grading_status_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("Grading status must be one of (graded|failed)") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
      it { expect(json(response.body)[:submissions_remaining]).to eq(3) }
      it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30T06:02:02.000Z") }
    end

    context 'participant has made their daily limit of submissions' do
      before do
        5.times {
          post '/api/external_graders/',
          params: valid_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      end
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("The participant has no submission slots remaining for today.") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
      it { expect(json(response.body)[:submissions_remaining]).to eq(0) }
      it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30T06:02:02.000Z") }
    end

    context 'post challenge submission' do
        before do
          Timecop.freeze(DateTime.new(2018, 1, 5, 2, 2, 2, "+02:00"))
          post '/api/external_graders/',
            params: valid_attributes,
            headers: { 'Authorization': auth_header(organizer.api_key) }
        end
        it { expect(response).to have_http_status(202) }
        it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
        it { expect(json(response.body)[:submission_id]).to be_a Integer }
        it { expect(json(response.body)[:submissions_remaining]).to eq(4) }
        it { expect(json(response.body)[:reset_dttm]).to eq("2018-01-06T01:02:02.000+01:00") }
        it { expect(Submission.count).to eq(4)}
        it { expect(Submission.last.participant_id).to eq(participant.id)}
        it { expect(Submission.last.score).to eq(valid_attributes_with_secondary_score[:score])}
        it { expect(Submission.last.grading_status_cd).to eq('graded')}
        it { expect(Submission.last.post_challenge).to be true }
      end

  end  # POST

  describe "PATCH /api/external_graders/:submission_id : update submission score or media" do
    def valid_media_attributes
      {
        media_large: '/s3 url',
        media_thumbnail: '/s3_thumbail',
        media_content_type: 'application/png'
      }
    end

    def valid_regrade_attributes
      {
        media_large: '/s3 url',
        media_thumbnail: '/s3_thumbail',
        media_content_type: 'application/png'
      }
    end

    def invalid_incomplete_media_attributes
      {
        media_large: '/s3 url',
        media_thumbnail: '/s3_thumbail',
        media_content_type: nil
      }
    end

    context "with valid_media_attributes" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: valid_media_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      it { puts Submission.find(submission1.id).inspect }
      it { expect(submission1.media_large).to eq(valid_media_attributes[:media_large]) }
      it { expect(submission1.media_thumbnail).to eq(valid_media_attributes[:media_thumbnail]) }
      it { expect(submission1.media_content_type).to eq(valid_media_attributes[:media_content_type]) }
    end

    context "with invalid submission id" do
      before {
        patch "/api/external_graders/999999",
          params: valid_media_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("Couldn't find Submission with 'id'=999999") }
    end

  end

  Timecop.return

end
