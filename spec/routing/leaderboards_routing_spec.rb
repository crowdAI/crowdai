require 'rails_helper'

RSpec.describe LeaderboardsController, type: :routing do
  describe 'valid admin routes' do
    it 'routes to admin/leaderboards#index' do
      expect(get: '/admin/leaderboards').to route_to('admin/leaderboards#index')
    end
  end

  describe 'valid challenge subrouting' do
    it 'routes to dataset_files#index' do
      expect(get: '/challenges/1/dataset_files').to route_to('dataset_files#index', challenge_id: '1')
    end
  end

  describe 'invalid routing' do
    it 'does not route to other leaderboard paths' do
      valid_routes = ['admin/leaderboards#index','leaderboards#index']
      routes = (`rake routes | grep leaderboard | awk '$4{print $4}'`).split(/\n+/)
      untested_routes = routes - valid_routes
      expect(untested_routes).to be_empty
    end
  end

end
