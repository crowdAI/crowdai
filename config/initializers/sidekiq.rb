require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
end

schedule_file = "config/schedule.yml"

if File.exists?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end

module Sidekiq
  module Middleware
    module Server
      class TaggedLogger

        def call(worker, item, queue)
          tag = "#{worker.class.to_s} #{SecureRandom.hex(12)}"
          ::Rails.logger.tagged(tag) do
            job_info = "Start at #{Time.now.to_default_s}: #{item.inspect}"
            ::Rails.logger.info(job_info)
            yield
          end
        end

      end
    end
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Middleware::Server::TaggedLogger
  end
end
