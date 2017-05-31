require 'spec_helper'

describe OngoingLeaderboard do
  context 'associations' do
    it { is_expected.to belong_to(:challenge) }
    it { is_expected.to belong_to(:participant) }
  end
end
