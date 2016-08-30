# -*- encoding: utf-8 -*-

require 'rails_helper'

describe Api::BaseController do


  describe 'GET auth_by_api_key' do
    it 'fails with no key' do
      get :auth_by_api_key, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
