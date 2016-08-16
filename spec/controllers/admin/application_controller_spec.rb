# -*- encoding: utf-8 -*-

require 'rails_helper'

describe Admin::ApplicationController do

  
  describe 'GET authenticate_admin' do
    it 'works' do
      get :authenticate_admin, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
