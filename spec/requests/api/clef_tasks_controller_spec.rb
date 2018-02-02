require 'rails_helper'

RSpec.describe Api::ClefTasksController, type: :request do

  let(:organizer) { create :organizer, api_key: '3d1efc2332200314c86d2921dd33434c' }
  let(:clef_task) { create :clef_task, organizer: organizer }
  let(:participant_clef_task) { create :participant_clef_task }

  describe "validate user API key" do
    context "with organiser auth key" do
      before {
        get "/api/clef_tasks/#{clef_task.id}",
          headers: {
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(200) }
    end
    context "with invalid organiser auth key" do
      before {
        get "/api/clef_tasks/#{clef_task.id}",
          headers: {
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header('123435346464574576865') } }
      it { expect(response).to have_http_status(401) }
    end
  end

  describe "GET /api/clef_tasks" do
    context 'invalid clef_task_id' do
      before {
        get "/api/clef_tasks/99999",
          headers: {
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(404) }
    end
    context 'valid clef_task_id' do
      before {
        get "/api/clef_tasks/#{clef_task.id}",
          headers: {
            'Content-Type': 'application/vnd.api+json',
            'Authorization': auth_header(organizer.api_key) } }
      it { expect(response).to have_http_status(200) }
      it { puts response.body }
      it { expect(response.body[:message]).to eq('123') }
    end
  end


end
