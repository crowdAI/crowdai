class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  after_filter :participant_activity
  #before_action :detect_device_variant
  after_action :track_action



  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
     :name, :email, :password, :password_confirmation, :remember_me) }
  end

  def track_action
    ahoy.track "Processed #{controller_name}##{action_name}", request.filtered_parameters
  end

  private
  def detect_device_variant
    request.variant = :mobile if browser.device.mobile? || browser.device.tablet?
  end

  def participant_activity
    current_participant.try :touch
  end

  def load_gon(vars = {})
  rails = {controller: controller_name, action: action_name}
  gon.rails = rails
  if vars.any?
    vars.each do |k,v|
      gon.send("#{k}=", v)
    end
  end
end
end
