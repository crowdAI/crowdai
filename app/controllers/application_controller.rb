class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  after_filter :participant_activity
  before_action :detect_device_variant

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end

  private
  def detect_device_variant
    request.variant = :mobile if browser.device.mobile? || browser.device.tablet?
  end

  def participant_activity
    current_participant.try :touch
  end
end
