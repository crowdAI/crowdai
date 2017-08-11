require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Crowdai

  DATE_FORMAT = '%d %B %Y'

  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.


    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :sidekiq
    #config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]
    config.secret_key_base = ENV["SECRET_KEY_BASE"]
    #config.action_controller.default_url_options = {:host => ENV['HOST']}
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths += Dir["#{Rails.root.to_s}/app/queries/**/"]
    #config.active_record.time_zone_aware_types = [:datetime]

    config.generators do |g|
      g.test_framework :rspec
    end
  end

end
