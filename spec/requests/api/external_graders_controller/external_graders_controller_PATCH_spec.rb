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

    def valid_meta_attributes_update
      {
        meta: {
          impwt_std: "0.01",
          ips_std: "3.5",
          snips: "45.69345202998776",
          file_key: "submissions/eeeeee-a525-4e5e-97a8-8ff7199be43c"
        }
      }
    end

    def valid_meta_attributes_update_as_json
      {
        meta: JSON.dump({
          impwt_std: "0.01",
          ips_std: "3.5",
          snips: "45.69345202998776",
          file_key: "submissions/eeeeee-a525-4e5e-97a8-8ff7199be43c"
        })
      }
    end


    def valid_meta_attributes_partial_update
      {
        meta: {
          impwt_std: "0.01",
          ips_std: "3.5",
          snips: "45.69345202998776",
          file_key: "submissions/eeeeee-a525-4e5e-97a8-8ff7199be43c"
        }
      }
    end

    def valid_meta_attributes_partial_update_as_json
      {
        meta: JSON.dump({
          impwt_std: "0.01",
          ips_std: "3.5",
          snips: "45.69345202998776",
          file_key: "submissions/eeeeee-a525-4e5e-97a8-8ff7199be43c"
        })
      }
    end


    def valid_meta_attributes_add
      {
        meta: {
          impwt_std: "0.020956583416961033",
          ips_std: "2.0898337641716487",
          new_key: "hello",
          file_key: "submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"
        }
      }
    end

    def valid_meta_attributes_add_as_json
      {
        meta: JSON.dump({
          impwt_std: "0.020956583416961033",
          ips_std: "2.0898337641716487",
          new_key: "hello",
          file_key: "submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"
        })
      }
    end

    def invalid_meta_attributes
      {
        meta: "THIS_IS_AN_INVALID_META_ATTRIBUTE"
      }
    end


    def valid_meta_attributes_multi
      {
        meta: {
          impwt_std: "0.020956583416961033",
          ips_std: "2.0898337641716487",
          snips: "45.69345202998776",
          file_key: "submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"
        }
      }
    end


    def valid_meta_attributes_multi_as_json
      {
        meta: JSON.dump({
          impwt_std: "0.020956583416961033",
          ips_std: "2.0898337641716487",
          snips: "45.69345202998776",
          file_key: "submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"
        })
      }
    end

    def invalid_incomplete_media_attributes
      {
        media_large: '/s3 url',
        media_thumbnail: '/s3_thumbail',
        media_content_type: nil
      }
    end

    def valid_attributes_grading_submitted_with_message
      { challenge_client_name: challenge.challenge_client_name,
        api_key: participant.api_key,
        grading_status: 'submitted',
        grading_message: 'in progress'
      }
    end

    def valid_youtube_attributes
      {
        media_large: "94EPSjQH38Y",
        media_thumbnail: "94EPSjQH38Y",
        media_content_type: "video/youtube"
      }
    end

    def invalid_youtube_attributes
      {
        media_large: "94EPSjQH38Y",
        media_content_type: "video/youtube"
      }
    end

=begin
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
      it { expect(submission1.media_large).to eq(valid_media_attributes[:media_large]) }
      it { expect(submission1.media_thumbnail).to eq(valid_media_attributes[:media_thumbnail]) }
      it { expect(submission1.media_content_type).to eq(valid_media_attributes[:media_content_type]) }
    end

    context "with invalid_meta_attributes - update" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: invalid_meta_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      it { expect(submission1.meta.symbolize_keys).to eq({}) }
    end

    context "with valid_meta_attributes - update" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: valid_meta_attributes_update,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      #it { expect(submission1.meta.symbolize_keys).to eq(valid_meta_attributes_update[:meta]) }
    end

    context "with valid_meta_attributes (as JSON)- update" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: valid_meta_attributes_update_as_json,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      #it { expect(submission1.meta.symbolize_keys).to eq(valid_meta_attributes_update[:meta]) }
    end

    context "with valid_meta_attributes - partial update" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: valid_meta_attributes_partial_update,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      #it { expect(submission1.meta.symbolize_keys).to eq({
    #    :impwt_std=>"0.01",
    #    :ips_std=>"3.5",
    #    :snips=>"45.69345202998776", :file_key=>"submissions/eeeeee-a525-4e5e-97a8-8ff7199be43c"}) }
    end

    context "with valid_meta_attributes (as JSON)- partial update" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: valid_meta_attributes_partial_update_as_json,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      #it { expect(submission1.meta.symbolize_keys).to eq({
      #  :impwt_std=>"0.01",
      #  :ips_std=>"3.5",
      #  :snips=>"45.69345202998776", :file_key=>"submissions/eeeeee-a525-4e5e-97a8-8ff7199be43c"}) }
    end


    context "with valid_meta_attributes - add" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: valid_meta_attributes_add,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      #it { expect(submission1.meta.symbolize_keys).to eq({
      #  :impwt_std=>"0.020956583416961033", :ips_std=>"2.0898337641716487",
      #  :new_key=>"hello", :file_key=>"submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"}) }
    end

    context "with valid_meta_attributes (as JSON) - add" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: valid_meta_attributes_add_as_json,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      #it { expect(submission1.meta.symbolize_keys).to eq({
      #  :impwt_std=>"0.020956583416961033", :ips_std=>"2.0898337641716487",
      #  :new_key=>"hello", :file_key=>"submissions/07b2ccb7-a525-4e5e-97a8-8ff7199be43c"}) }
    end
=end
    context "valid_attributes_grading_submitted_with_message" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: valid_attributes_grading_submitted_with_message,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      it { expect(submission1.grading_status_cd).to eq('submitted') }
      it { expect(submission1.grading_message).to eq('in progress') }
    end

    context "with invalid submission id" do
      before {
        patch "/api/external_graders/999999",
          params: valid_media_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(400) }
      it { expect(json(response.body)[:message]).to eq("Couldn't find Submission with 'id'=999999") }
    end

    context "with valid_youtube_attributes" do
      before do
        patch "/api/external_graders/#{submission1.id}",
          params: valid_youtube_attributes,
          headers: { 'Authorization': auth_header(organizer.api_key) }
        submission1.reload
      end
      it { expect(response).to have_http_status(202) }
      it { expect(json(response.body)[:message]).to eq("Submission #{submission1.id} updated") }
      it { expect(json(response.body)[:submission_id]).to eq(submission1.id.to_s)}
      it { expect(submission1.media_large).to eq(valid_youtube_attributes[:media_large]) }
      it { expect(submission1.media_thumbnail).to eq(valid_youtube_attributes[:media_thumbnail]) }
      it { expect(submission1.media_content_type).to eq('video/youtube') }
    end

  end

  Timecop.return

end
