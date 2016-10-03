require 'spec_helper'

describe OngoingLeaderboard do
  context 'associations' do
    it { should belong_to(:challenge) }
    it { should belong_to(:participant) }
  end
end
