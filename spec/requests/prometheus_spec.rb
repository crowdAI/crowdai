=begin
require 'rails_helper'

RSpec.describe "Prometheus endpoint", type: :request do

  describe 'Prometheus::ParticipantCounterService' do
    before do
      create :submission
    end
    it do
      get '/metrics'
      puts response.body
      #expect(response.body).to eq(1)
    end
  end

  describe 'Prometheus::SubmissionCounterService' do

  end

end
=end
