Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = true
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass
  config.assets.compile = true
  config.assets.digest = true
  config.force_ssl = true
  config.log_level = :info
  config.i18n.fallbacks = true
  #config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.default_url_options = { host: ENV["HOST"] }
  config.action_controller.asset_host = "https://#{ENV['CLOUDFRONT_ASSETS_DOMAIN']}"
end
Rails.application.routes.default_url_options[:host] = ENV['HOST']
CarrierWave.configure do |config|
  config.asset_host = "https://#{ENV['CLOUDFRONT_IMAGES_DOMAIN']}"
end
