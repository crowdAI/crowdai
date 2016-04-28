

require 'rails_helper'

RSpec.describe ChallengesController, type: :routing do
  describe 'valid routes' do
    it 'routes to admin/challenges#index' do
      expect(get: '/admin/challenges').to route_to('admin/challenges#index')
    end

    it 'routes to admin/challenges#create' do
      expect(post: '/admin/challenges').to route_to('admin/challenges#create')
    end

    it 'routes to admin/challenges#new' do
      expect(get: '/admin/challenges/new').to route_to('admin/challenges#new')
    end

    it 'routes to admin/challenges#edit' do
      expect(get: '/admin/challenges/1/edit').to route_to('admin/challenges#edit', id: '1')
    end

    it 'routes to admin/challenges#show' do
      expect(get: '/admin/challenges/1').to route_to('admin/challenges#show', id: '1')
    end

    it 'routes to admin/challenges#update' do
      expect(patch: '/admin/challenges/1').to route_to('admin/challenges#update', id: '1')
    end

    it 'routes to admin/challenges#update' do
      expect(put: '/admin/challenges/1').to route_to('admin/challenges#update', id: '1')
    end

    it 'routes to admin/challenges#destroy' do
      expect(delete: '/admin/challenges/1').to route_to('admin/challenges#destroy', id: '1')
    end



    it 'routes to challenges#index' do
      expect(get: '/organizers/1/challenges').to route_to('challenges#index', organizer_id: '1')
    end

    it 'routes to challenges#create' do
      expect(post: '/organizers/1/challenges').to route_to('challenges#create', organizer_id: '1')
    end

    it 'routes to challenges#new' do
      expect(get: '/organizers/1/challenges/new').to route_to('challenges#new', organizer_id: '1')
    end

    it 'routes to challenges#edit' do
      expect(get: '/organizers/1/challenges/1/edit').to route_to('challenges#edit', organizer_id: '1', id: '1')
    end

    it 'routes to challenges#show' do
      expect(get: '/organizers/1/challenges/1').to route_to('challenges#show', organizer_id: '1', id: '1')
    end

    it 'routes to challenges#update' do
      expect(patch: '/organizers/1/challenges/1').to route_to('challenges#update', organizer_id: '1', id: '1')
    end

    it 'routes to challenges#update' do
      expect(put: '/organizers/1/challenges/1').to route_to('challenges#update', organizer_id: '1', id: '1')
    end

    it 'routes to challenges#destroy' do
      expect(delete: '/organizers/1/challenges/1').to route_to('challenges#destroy', organizer_id: '1', id: '1')
    end

    it 'routes to challenges#index' do
      expect(get: '/challenges').to route_to('challenges#index')
    end

    it 'routes to challenges#create' do
      expect(post: '/challenges').to route_to('challenges#create')
    end

    it 'routes to challenges#new' do
      expect(get: '/challenges/new').to route_to('challenges#new')
    end

    it 'routes to challenges#edit' do
      expect(get: '/challenges/1/edit').to route_to('challenges#edit', id: '1')
    end

    it 'routes to challenges#show' do
      expect(get: '/challenges/1').to route_to('challenges#show', id: '1')
    end

    it 'routes to challenges#update' do
      expect(patch: '/challenges/1').to route_to('challenges#update', id: '1')
    end

    it 'routes to challenges#update' do
      expect(put: '/challenges/1').to route_to('challenges#update', id: '1')
    end

    it 'routes to challenges#destroy' do
      expect(delete: '/challenges/1').to route_to('challenges#destroy', id: '1')
    end

    it 'routes to challenges#index' do
      expect(get: '/').to route_to('challenges#index')
    end
  end
end
