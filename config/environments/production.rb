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

  #config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false

  #config.action_mailer.default_url_options = { host: ENV["HOST"] }
  config.action_mailer.default_url_options = { host: ENV["HOST"] }
  #config.action_mailer.delivery_method = :smtp
  #config.action_mailer.perform_deliveries = true
  #config.action_mailer.raise_delivery_errors = false
  #config.action_mailer.default :charset => "utf-8"

  #config.action_mailer.smtp_settings = {
  #  :address   => ENV["SMTP_ADDRESS"],
  #  :port      => ENV["SMTP_PORT"],
  #  :enable_starttls_auto => true, # detects and uses STARTTLS
  #  :user_name => ENV["SMTP_USERNAME"],
  #  :password  => ENV["SMTP_PASSWORD"],
  #  :authentication => 'login', # Mandrill supports 'plain' or 'login'
  #  :domain => ENV["SMTP_DOMAIN"]
  #}

end
Rails.application.routes.default_url_options[:host] = ENV['HOST']
