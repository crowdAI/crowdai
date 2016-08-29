require 'rails_helper'

describe Api::DockerCallbacksController do


  describe 'POST create' do
    it 'works' do
      post :create, {}, {}
      expect(response.status).to eq(200)
    end
  end

end
