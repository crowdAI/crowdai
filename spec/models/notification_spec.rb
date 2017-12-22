require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe "scopes" do

    let!(:new_notification1) { create(:notification, created_at: 2.days.ago) }
    let!(:new_notification2) { create(:notification, created_at: 3.hours.ago) }
    let!(:touched_notification) { create(:notification, :touched, created_at: 5.days.ago) }
    let!(:read_notification) { create(:notification, :read, created_at: 10.days.ago) }

    describe "#pristine" do
      it "returns the notifications that user hasn't touched" do
        expect(Notification.pristine).to match_array([new_notification1, new_notification2])
      end
    end

    describe "#recent" do
      it "returns notifications in order based on created_at field" do
        expect(Notification.recent).to eq([new_notification2, new_notification1, touched_notification, read_notification])
      end
    end

    describe "#unread" do
      it "returns only unread notifications" do
        expect(Notification.unread).not_to include(read_notification)
        expect(Notification.unread.count).to eq(3)
      end
    end

    context 'notifiable: Comment' do
      let!(:participant) { create :participant }
      let!(:comment) { create :comment }
      let!(:notification) { create :notification, notifiable: comment, participant: participant }
      describe '#link' do
        it { expect(notification.link).to eq("/topics/#{comment.topic.slug}/discussion") }
      end
      describe '#thumb' do
        it { expect(notification.thumb).to eq(comment.participant.image_file.url) }
      end
    end

  end
end
