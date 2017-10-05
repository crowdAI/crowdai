require 'sidekiq/testing'

Rails.application.configure do
  Sidekiq::Testing.inline!
  if !ENV['TRAVIS']
    figaro_file = File.join(Rails.root, 'config', 'application.yml')
    YAML::load_file(figaro_file).symbolize_keys[:test].each do |key,value|
      ENV[key.to_s] = value
    end
  end
  config.cache_classes = false
  config.eager_load = false
  #config.public_file_server.enabled = true
  #config.public_file_server.headers = {
  #  'Cache-Control' => "public, max-age=#{1.hour.seconds.to_i}"
  #}
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :test
  config.active_support.deprecation = :stderr
  config.assets.raise_runtime_errors = true
  config.assets.debug = true

  #   config.assets.quiet = true
end
Rails.application.routes.default_url_options[:host] = ENV['HOST']
