require 'rails_helper'

RSpec.describe Api::ExternalGradersController, type: :request do

  before do
    Timecop.freeze(DateTime.new(2017, 10, 30, 2, 2, 2, "+02:00"))
  end

  after do
    Timecop.return
  end

  let!(:organizer) {
    create :organizer,
    api_key: '3d1efc2332200314c86d2921dd33434c' }
  let!(:challenge) {
    create :challenge,
    :running,
    organizer: organizer }
  let!(:challenge_round) {
    create :challenge_round,
    challenge_id: challenge.id,
    start_dttm: 4.weeks.ago,
    end_dttm: 4.weeks.since }
  let!(:participant) {
    create :participant,
    api_key: '5762b9423a01f72662264358f071908c' }
  let!(:submission1) {
    create :submission,
    challenge: challenge,
    participant: participant,
    created_at: 2.hours.ago }
  let!(:submission2) {
    create :submission,
    challenge: challenge,
    participant: participant,
    created_at: 18.hours.ago }
  let!(:submission3) {
    create :submission,
    challenge: challenge,
    participant: participant,
    created_at: 2.days.ago }


  describe "POST /api/external_graders/ : create submission" do
    def valid_attributes
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763
      }
    end

    def valid_attributes_initiated
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'initiated'
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

    def valid_attributes_grading_submitted
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'submitted'
      }
    end

    def valid_attributes_grading_submitted_with_message
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'submitted',
        grading_message: 'in progress'
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

    def valid_attributes_with_description_markdown
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        description_markdown: "**My first submission!**"
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

    def valid_attributes_with_meta
      {
        challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        meta: {
          impwt_std: "0.020956583416961033",
          ips_std: "2.0898337641716487",
          snips: "45.69345202998776",
          file_key: "submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"
        }
      }
    end

    def valid_attributes_with_meta_as_json
      {
        challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        meta: JSON.dump({
          impwt_std: "0.020956583416961033",
          ips_std: "2.0898337641716487",
          snips: "45.69345202998776",
          file_key: "submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"
        })
      }
    end

    def invalid_attributes_with_meta
      {
        challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        meta: "THIS IS A BAD META PARAM"
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

    def valid_challenge_round_attributes
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        challenge_round_id: challenge_round.id
      }
    end

    def invalid_challenge_round_attributes
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        challenge_round_id: -1
      }
    end

    def valid_youtube_attributes
      {
        challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        media_large: "94EPSjQH38Y",
        media_thumbnail: "94EPSjQH38Y",
        media_content_type: "video/youtube"
      }
    end

    def invalid_youtube_attributes
      {
        challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'graded',
        score: 0.9763,
        media_large: "94EPSjQH38Y",
        media_content_type: "video/youtube"
      }
    end

    # ---------------------- RETURNING 200 ------------------ #
    context "with valid_attributes" do
      before do
        post '/api/external_graders/',
          params: valid_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(json(response.body)[:submissions_remaining]).to eq(2) }
      if not ENV['TRAVIS']
        it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30 06:02:02 UTC") }
      end
      it { expect(Submission.count).to eq(4)}
      it { expect(Submission.last.participant_id).to eq(participant.id)}
      it { expect(Submission.last.score).to eq(valid_attributes_with_secondary_score[:score])}
      it { expect(Submission.last.grading_status_cd).to eq('graded')}
      it { expect(Submission.last.post_challenge).to be false }
    end

    context "with valid_attributes_initiated" do
      before do
        post '/api/external_graders/',
          params: valid_attributes_initiated,
          headers: { 'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(json(response.body)[:submissions_remaining]).to eq(2) }
      if not ENV['TRAVIS']
        it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30 06:02:02 UTC") }
      end
      it { expect(Submission.count).to eq(4)}
      it { expect(Submission.last.participant_id).to eq(participant.id)}
      it { expect(Submission.last.score).to be_nil}
      it { expect(Submission.last.grading_status_cd).to eq('initiated')}
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

    context "with valid_attributes_grading_submitted" do
      before {
        post '/api/external_graders/',
          params: valid_attributes_grading_submitted,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.participant_id).to eq(participant.id)}
      it { expect(Submission.last.score).to eq(nil)}
      it { expect(Submission.last.grading_status_cd).to eq('submitted')}
    end

    context "with valid_attributes_grading_submitted_with_message" do
      before {
        post '/api/external_graders/',
          params: valid_attributes_grading_submitted_with_message,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.participant_id).to eq(participant.id)}
      it { expect(Submission.last.score).to eq(nil)}
      it { expect(Submission.last.grading_status_cd).to eq('submitted')}
      it { expect(Submission.last.grading_message).to eq('in progress')}
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

    context "with valid_attributes_with_description_markdown" do
      before {
        post '/api/external_graders/',
          params: valid_attributes_with_description_markdown,
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

    context "with valid_attributes_with_meta" do
      before do
        post '/api/external_graders/',
          params: valid_attributes_with_meta,
          headers: { 'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.meta).to eq({
        "impwt_std"=>"0.020956583416961033", "ips_std"=>"2.0898337641716487",
        "snips"=>"45.69345202998776", "file_key"=>"submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"}) }
      it { expect(Submission.last.post_challenge).to be false }
    end

    context "with valid_attributes_with_meta (as JSON)" do
      before do
        post '/api/external_graders/',
          params: valid_attributes_with_meta_as_json,
          headers: { 'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.meta).to eq({
        "impwt_std"=>"0.020956583416961033", "ips_std"=>"2.0898337641716487",
        "snips"=>"45.69345202998776", "file_key"=>"submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"}) }
      it { expect(Submission.last.post_challenge).to be false }
    end

    context 'post challenge submission' do
      before do
        post '/api/external_graders/',
          params: valid_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).
        to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(json(response.body)[:submissions_remaining]).to eq(2) }
      if not ENV['TRAVIS']
        it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30 06:02:02 UTC") }
      end
      it { expect(Submission.count).to eq(4)}
      it { expect(Submission.last.participant_id).to eq(participant.id)}
      it { expect(Submission.last.score).
        to eq(valid_attributes_with_secondary_score[:score])}
      it { expect(Submission.last.grading_status_cd).to eq('graded')}
        #it { expect(Submission.last.post_challenge).to be true }
    end

    context "with invalid_attributes_with_meta" do
      before do
        post '/api/external_graders/',
          params: invalid_attributes_with_meta,
          headers: { 'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Participant #{participant.name} scored") }
      it { expect(json(response.body)[:submission_id]).to be_a Integer }
      it { expect(Submission.last.meta).to eq({}) }
      it { expect(Submission.last.post_challenge).to be false }
    end

    context 'with a valid challenge_round_id' do
      before do
        post '/api/external_graders/',
          params: valid_challenge_round_attributes,
          headers: {
            'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(Submission.last.challenge_round_id).to eq(valid_challenge_round_attributes[:challenge_round_id])}
    end

    context 'with valid_youtube_attributes' do
      before do
        post '/api/external_graders/',
          params: valid_youtube_attributes,
          headers: {
            'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(202) }
      it { expect(Submission.last.media_large)
        .to eq(valid_youtube_attributes[:media_large])}
      it { expect(Submission.last.media_thumbnail)
        .to eq(valid_youtube_attributes[:media_thumbnail])}
      it { expect(Submission.last.media_content_type)
        .to eq("video/youtube")}
    end

    # ---------------------- RETURNING ERRORS ------------------ #
    context 'with a invalid challenge_round_id' do
      before do
        post '/api/external_graders/',
          params: invalid_challenge_round_attributes,
          headers: {
            'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(400) }
      it { expect(Submission.last.challenge_round_id).to eq(valid_challenge_round_attributes[:challenge_round_id])}
    end

    context "with invalid grading status" do
      before {
        post '/api/external_graders/',
          params: invalid_grading_status_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("Grading status must be one of (graded|failed|initiated)") }
      it { expect(json(response.body)[:submission_id]).to be_nil }
      it { expect(json(response.body)[:submissions_remaining]).to eq(3) }
      if not ENV['TRAVIS']
        it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30 06:02:02 UTC") }
      end
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
      if not ENV['TRAVIS']
        it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30 06:02:02 UTC") }
      end
    end

    context "with incomplete Media fields" do
      before {
        post '/api/external_graders/',
          params: invalid_incomplete_with_media_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("Either all or none of media_large, media_thumbnail and media_content_type must be provided.") }
    end

    context "with invalid Challenge Client Name" do
      before {
        post '/api/external_graders/',
          params: invalid_challenge_client_name_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(401) }
      it { expect(response.body).to eq("HTTP Token: Access denied.\n") }
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

    context 'with invalid_youtube_attributes' do
      before do
        post '/api/external_graders/',
          params: invalid_youtube_attributes,
          headers: {
            'Authorization': auth_header(organizer.api_key) }
      end
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("Either all or none of media_large, media_thumbnail and media_content_type must be provided.")}
    end

=begin
    context 'participant has made their weekly limit of submissions' do
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
      if not ENV['TRAVIS']
        it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30T06:02:02.000Z") }
      end
    end

    context 'participant has made their challenge round limit of submissions' do
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
      if not ENV['TRAVIS']
        it { expect(json(response.body)[:reset_dttm]).to eq("2017-10-30T06:02:02.000Z") }
      end
    end
=end



  end  # POST

  Timecop.return

end
