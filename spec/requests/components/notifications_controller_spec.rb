require "rails_helper"

RSpec.describe Components::NotificationsController do

  let(:fred) { create(:participant, name: "Fred") }
  let(:sally) { create(:participant, name: "Han") }
  let(:freds_post1) { create(:comment, participant: fred) }
  let(:freds_post2) { create(:comment, participant: fred) }

  describe "POST #mark_as_touched" do
    before :each do
      @notification = Notification.create(participant: sally,
                                          notification: "liked your",
                                          notifiable: freds_post1,
                                          is_new: true)
      sign_in sally
    end

    it "sets is_new field to false" do
      post :mark_as_touched
      @notification.reload
      expect(@notification.is_new).to be_falsy
    end
  end

  describe "POST #mark_as_read" do
    before :each do
      @notification1 = Notification.create(participant: sally,
                                          notification: "liked your",
                                          notifiable: freds_post1,
                                          is_new: true)

      @notification2 = Notification.create(participant: sally,
                                          notification: "liked your",
                                          notifiable: freds_post2,
                                          is_new: true)
      sign_in sally
    end

    it "sets read_at timestamp" do
      post :mark_as_read, id: @notification1.id
      @notification1.reload
      @notification2.reload
      expect(@notification1.read_at).not_to be_nil
      expect(@notification2.read_at).to be_nil
    end
  end

  describe "POST #mark_all_as_read" do
    before :each do
      @notification1 = Notification.create(participant: sally,
                                          notification: "liked your",
                                          notifiable: freds_post1,
                                          is_new: true)

      @notification2 = Notification.create(participant: sally,
                                          notification: "liked your",
                                          notifiable: freds_post2,
                                          is_new: true)
      sign_in sally
    end

    it "sets read_at timestamp" do
      post :mark_all_as_read
      @notification1.reload
      @notification2.reload
      expect(@notification1.read_at).not_to be_nil
      expect(@notification2.read_at).not_to be_nil
    end
  end
end
