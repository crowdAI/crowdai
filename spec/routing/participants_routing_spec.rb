# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ParticipantsController, type: :routing do
  describe 'routing' do
    it 'routes to regen key' do
      expect(get: '/participants/sean/regen_api_key').to route_to(controller: 'participants', action: 'regen_api_key', participant_id: 'sean')
      expect(get: '/participants/1/regen_api_key').to route_to(controller: 'participants', action: 'regen_api_key', participant_id: '1')
    end
  end
end

require 'rails_helper'

RSpec.describe ParticipantsController, type: :routing do
  describe 'routing' do

    it 'routes to #show' do
      expect(get: '/participants/1').to route_to('participants#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/participants/1/edit').to route_to('participants#edit', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/participants/1').to route_to('participants#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/participants/1').to route_to('participants#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/participants/1').to route_to('participants#destroy', id: '1')
    end
  end

  describe 'devise routes' do
    it 'new account' do
      expect(:get=>"/participants/new").to route_to(:controller=>"participants", :action=>"show", :id=>"new")
    end

    it 'update account' do
      expect(:post=>"/participants").to route_to(:controller=>"devise/registrations", :action=>"create")
    end
  end

  describe 'invalid routes' do
    it 'does not route to #index' do
      expect(get: '/participants').not_to be_routable
    end
  end
end
