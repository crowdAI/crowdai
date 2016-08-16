# -*- encoding: utf-8 -*-

require 'rails_helper'

describe SubmissionsController do

  
  describe 'GET index' do
    it 'works' do
      get :index, {}, {}
      expect(response.status).to eq(200)
    end
  end

  
  describe 'GET leaderboard' do
    it 'works' do
      get :leaderboard, {}, {}
      expect(response.status).to eq(200)
    end
  end

  
  describe 'GET show' do
    it 'works' do
      get :show, {}, {}
      expect(response.status).to eq(200)
    end
  end

  
  describe 'GET new' do
    it 'works' do
      get :new, {}, {}
      expect(response.status).to eq(200)
    end
  end

  
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

  
  describe 'GET grade' do
    it 'works' do
      get :grade, {}, {}
      expect(response.status).to eq(200)
    end
  end

  
  describe 'GET execute' do
    it 'works' do
      get :execute, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
