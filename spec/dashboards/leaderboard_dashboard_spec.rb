# -*- encoding: utf-8 -*-

require 'spec_helper'

describe LeaderboardDashboard do

  
  describe '#display_resource' do
    it 'works' do
      leaderboard_dashboard = LeaderboardDashboard.new
      leaderboard = double('leaderboard')
      result = leaderboard_dashboard.display_resource(leaderboard)
      expect(result).not_to be_nil
    end
  end

end
