require 'spec_helper'

describe Leaderboard do
  context 'associations' do
    it { should belong_to(:challenge) }
    it { should belong_to(:participant) }
  end
end
