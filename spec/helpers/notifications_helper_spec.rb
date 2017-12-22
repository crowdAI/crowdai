require 'rails_helper'

describe NotificationsHelper do
  let!(:notification) { create :notification }

  context '#notification_details(notification)' do
    it { expect(notification_details(notification)).to eq('123') }
  end

end
