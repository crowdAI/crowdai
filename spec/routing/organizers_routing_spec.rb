require 'rails_helper'

RSpec.describe OrganizersController, type: :routing do
  describe 'valid admin routes' do
    it 'routes to admin/organizers#index' do
      expect(get: '/admin/organizers').to route_to('admin/organizers#index')
    end

    it 'routes to admin/organizers#create' do
      expect(post: '/admin/organizers').to route_to('admin/organizers#create')
    end

    it 'routes to admin/organizers#new' do
      expect(get: '/admin/organizers/new').to route_to('admin/organizers#new')
    end

    it 'routes to admin/organizers#edit' do
      expect(get: '/admin/organizers/1/edit').to route_to('admin/organizers#edit', id: '1')
    end

    it 'routes to admin/organizers#show' do
      expect(get: '/admin/organizers/1').to route_to('admin/organizers#show', id: '1')
    end

    it 'routes to admin/organizers#update' do
      expect(patch: '/admin/organizers/1').to route_to('admin/organizers#update', id: '1')
    end

    it 'routes to admin/organizers#update' do
      expect(put: '/admin/organizers/1').to route_to('admin/organizers#update', id: '1')
    end

    it 'routes to admin/organizers#destroy' do
      expect(delete: '/admin/organizers/1').to route_to('admin/organizers#destroy', id: '1')
    end
  end

  describe 'valid routes' do
    it 'routes to organizers#index' do
      expect(get: '/organizers').to route_to('organizers#index')
    end

    it 'routes to organizers#create' do
      expect(post: '/organizers').to route_to('organizers#create')
    end

    it 'routes to organizers#new' do
      expect(get: '/organizers/new').to route_to('organizers#new')
    end

    it 'routes to organizers#edit' do
      expect(get: '/organizers/1/edit').to route_to('organizers#edit', id: '1')
    end

    it 'routes to organizers#show' do
      expect(get: '/organizers/1').to route_to('organizers#show', id: '1')
    end

    it 'routes to organizers#update' do
      expect(patch: '/organizers/1').to route_to('organizers#update', id: '1')
    end

    it 'routes to organizers#update' do
      expect(put: '/organizers/1').to route_to('organizers#update', id: '1')
    end

    it 'routes to organizers#destroy' do
      expect(delete: '/organizers/1').to route_to('organizers#destroy', id: '1')
    end
  end



end
