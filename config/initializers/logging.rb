unless Rails.env.test?
  ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
end
