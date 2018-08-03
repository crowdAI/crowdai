# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

rackapp = Rack::Builder.app do
  use Prometheus::Middleware::Collector

  map '/metrics' do
    use Rack::Auth::Basic, 'Prometheus Metrics' do |username, password|
      Rack::Utils.secure_compare(ENV['CROWDAI_API_KEY'], password)
    end
    use Rack::Deflater
    use Prometheus::Middleware::Exporter, path: ''
    run ->(_) { [500, { 'Content-Type' => 'text/html' }, ['crowdAI metrics endpoint is unreachable!']] }
  end

  run Rails.application
end
run rackapp
