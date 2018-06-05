Rails.application.configure do
  figaro_file = File.join(Rails.root, 'config', 'application.yml')
  YAML::load_file(figaro_file).symbolize_keys[:development].each do |key,value|
    ENV[key.to_s] = value
  end
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.quiet = false
  config.assets.raise_runtime_errors = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.web_console.whiny_requests = false
  config.active_storage.service = :local

end


Rails.application.routes.default_url_options[:host] = ENV['HOST']
