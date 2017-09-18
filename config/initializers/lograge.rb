Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.custom_options = lambda do |event|
    options = event.payload.slice(:request_id, :user_id)
    options[:params] = event.payload[:params].except("controller", "action")
    options
  end
end
