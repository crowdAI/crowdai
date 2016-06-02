require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
end

Sidekiq.configure_server do |config|
  config.logger.level = Logger::DEBUG
  config.redis = { size: 4 }
end
