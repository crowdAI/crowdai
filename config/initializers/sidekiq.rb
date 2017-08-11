require 'sidekiq'
require 'sidekiq-scheduler'

Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
end

Sidekiq.configure_server do |config|
  config.logger.level = Logger::DEBUG
  config.redis = { size: 4 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDISTOGO_URL"] }
end unless ENV['REDISTOGO_URL'].blank?

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDISTOGO_URL"] }
end unless ENV['REDISTOGO_URL'].blank?
