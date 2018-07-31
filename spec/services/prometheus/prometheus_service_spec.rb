=begin
require 'rails_helper'

RSpec.describe Prometheus::PrometheusService do

  describe 'access endpoint with password' do
    http_basic_login
    GET '/metrics', {}, @env
    it do
      #expect
    end
  end

  describe 'cannot access endpoint without password' do

  end


end
=end
