require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { size: 1,
                   url: 'redis://localhost:6379/'}
end

schedule_file = "config/schedule.yml"
if File.exists?(schedule_file) #&& Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end

unless Rails.env.test?
  Sidekiq::Logging.logger.level = Logger::DEBUG
  Rails.logger = Sidekiq::Logging.logger
end
