# -*- encoding: utf-8 -*-

require 'rails_helper'

describe BaseController do

  
  describe 'GET auth_by_api_key' do
    it 'works' do
      get :auth_by_api_key, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
