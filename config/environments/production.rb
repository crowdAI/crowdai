Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.read_encrypted_secrets = false
  config.public_file_server.enabled = true
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass
  config.assets.compile = true
  config.log_level = :info
  config.log_tags = [ :request_id ]
  config.i18n.fallbacks = true
  config.log_formatter = ::Logger::Formatter.new

  # Use a real queuing backend for Active Job (and separate queues per environment)
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :notify

  # Use a different logger for distributed setups.
  config.action_mailer.default_url_options = { host: ENV["HOST"] }

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false
end
Rails.application.routes.default_url_options[:host] = ENV['HOST']
CarrierWave.configure do |config|
  config.asset_host = "https://#{ENV['CLOUDFRONT_IMAGES_DOMAIN']}"
end
