require 'rails_helper'

RSpec.describe NotificationService do

  let!(:participant) { create :participant }

  context 'comment' do
    let!(:comment) { create :comment }
    it 'creates a notification' do
      expect {
        described_class.new(participant.id,comment,'comment').call
      }.to change(Notification, :count).by(1)
    end
  end

end
