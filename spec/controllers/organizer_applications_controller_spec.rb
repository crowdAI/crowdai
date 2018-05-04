require 'rails_helper'
=begin TODO remove this completely
RSpec.describe OrganizerApplicationsController, type: :controller do
  include ActiveJob::TestHelper
  render_views

  let(:valid_attributes) {
    FactoryBot.attributes_for(:organizer_application)
  }

  describe "POST #create" do
    it "creates a new OrganizerApplication" do
      expect {
        post :create, params: {organizer_application: valid_attributes}, format: :js
      }.to change(OrganizerApplication, :count).by(1)
    end

    it "queues Admin::OrganizerApplicationNotificationJob" do
      expect {
        post :create, params: {organizer_application: valid_attributes}, format: :js
      }.to have_enqueued_job(Admin::OrganizerApplicationNotificationJob)
    end

    it "queues OrganizerApplicationNotificationJob" do
      expect {
        post :create, params: {organizer_application: valid_attributes}, format: :js
      }.to have_enqueued_job(OrganizerApplicationNotificationJob)
    end

    it "renders the ajax updater template" do
      post :create, params: {organizer_application: valid_attributes}, format: :js
      expect(response).to render_template('landing_page/ajax/application_accepted')
    end
  end

end
=end
