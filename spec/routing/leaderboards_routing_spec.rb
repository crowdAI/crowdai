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


end
