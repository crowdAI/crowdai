require "rails_helper"

RSpec.describe Components::NotificationsController do

  let(:fred) { create(:participant, name: "Fred") }
  let(:sally) { create(:participant, name: "Han") }
  let(:freds_post1) { create(:comment, participant: fred) }
  let(:freds_post2) { create(:comment, participant: fred) }

  describe "POST #mark_as_touched" do
    let!(:notification) { create(:notification, participant: sally, notifiable: freds_post1freds_post1) }
    before :each do
      sign_in sally
    end

    it "sets is_new field to false" do
      post "/components/notifications/#{notification.id}/mark_as_touched",
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json' }
      notification.reload
      expect(notification.is_new).to be false
    end
  end

  describe "POST #mark_as_read" do
    let!(:notification1) { create(:notification, participant: sally, notifiable: freds_post1) }
    let!(:notification2) { create(:notification, participant: sally, notifiable: freds_post2) }
    before :each do
      sign_in sally
    end

    it "sets read_at timestamp" do
      post "/components/notifications/#{notification1.id}/mark_as_read",
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json' }
      notification1.reload
      expect(notification1.read_at).not_to be_nil
      expect(notification2.read_at).to be_nil
    end
  end

  describe "POST #mark_all_as_read" do
    let!(:notification1) { create(:notification, participant: sally, notifiable: freds_post1) }
    let!(:notification2) { create(:notification, participant: sally, notifiable: freds_post2) }
    before :each do
      sign_in sally
    end

    it "sets read_at timestamp" do
      post '/components/notifications/mark_all_as_read',
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json' }
      notification1.reload
      notification2.reload
      expect(notification1.read_at).not_to be_nil
      expect(notification2.read_at).not_to be_nil
    end
  end
end
