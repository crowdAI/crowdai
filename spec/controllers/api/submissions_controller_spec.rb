# -*- encoding: utf-8 -*-

require 'rails_helper'

describe Api::SubmissionsController do


  describe 'PUT update' do
    it 'works' do
      put :update, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
