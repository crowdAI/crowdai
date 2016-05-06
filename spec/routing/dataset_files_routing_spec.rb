
require 'rails_helper'

RSpec.describe DatasetFilesController, type: :routing do
  describe 'valid admin routing' do
    it 'routes to admin/dataset_files#index' do
      expect(get: '/admin/dataset_files').to route_to('admin/dataset_files#index')
    end

    it 'routes to admin/dataset_files#create' do
      expect(post: '/admin/dataset_files').to route_to('admin/dataset_files#create')
    end

    it 'routes to admin/dataset_files#new' do
      expect(get: '/admin/dataset_files/new').to route_to('admin/dataset_files#new')
    end

    it 'routes to admin/dataset_files#edit' do
      expect(get: '/admin/dataset_files/1/edit').to route_to('admin/dataset_files#edit', id: '1')
    end

    it 'routes to admin/dataset_files#show' do
      expect(get: '/admin/dataset_files/1').to route_to('admin/dataset_files#show', id: '1')
    end

    it 'routes to admin/dataset_files#update' do
      expect(patch: '/admin/dataset_files/1').to route_to('admin/dataset_files#update', id: '1')
    end

    it 'routes to admin/dataset_files#update' do
      expect(put: '/admin/dataset_files/1').to route_to('admin/dataset_files#update', id: '1')
    end

    it 'routes to admin/dataset_files#destroy' do
      expect(delete: '/admin/dataset_files/1').to route_to('admin/dataset_files#destroy', id: '1')
    end
  end

  describe 'valid challenge subrouting' do
    it 'routes to dataset_files#index' do
      expect(get: '/challenges/1/dataset_files').to route_to('dataset_files#index', challenge_id: '1')
    end

    it 'routes to dataset_files#create' do
      expect(post: '/challenges/1/dataset_files').to route_to('dataset_files#create', challenge_id: '1')
    end

    it 'routes to dataset_files#new' do
      expect(get: '/challenges/1/dataset_files/new').to route_to('dataset_files#new', challenge_id: '1')
    end

    it 'routes to dataset_files#edit' do
      expect(get: '/challenges/1/dataset_files/1/edit').to route_to('dataset_files#edit', challenge_id: '1', id: '1')
    end

    it 'routes to dataset_files#show' do
      expect(get: '/challenges/1/dataset_files/1').to route_to('dataset_files#show', challenge_id: '1', id: '1')
    end

    it 'routes to dataset_files#update' do
      expect(patch: '/challenges/1/dataset_files/1').to route_to('dataset_files#update', challenge_id: '1', id: '1')
    end

    it 'routes to dataset_files#update' do
      expect(put: '/challenges/1/dataset_files/1').to route_to('dataset_files#update', challenge_id: '1', id: '1')
    end

    it 'routes to dataset_files#destroy' do
      expect(delete: '/challenges/1/dataset_files/1').to route_to('dataset_files#destroy', challenge_id: '1', id: '1')
    end
  end
end
