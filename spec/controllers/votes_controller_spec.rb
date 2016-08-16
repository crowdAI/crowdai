# -*- encoding: utf-8 -*-

require 'rails_helper'

describe VotesController do

  
  describe 'POST create' do
    it 'works' do
      post :create, {}, {}
      expect(response.status).to eq(200)
    end
  end

  
  describe 'DELETE destroy' do
    it 'works' do
      delete :destroy, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
