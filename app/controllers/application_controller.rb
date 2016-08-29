class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  protect_from_forgery with: :exception
  after_filter :participant_activity
  before_action :detect_device_variant
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_paper_trail_whodunnit

  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
     :name, :email, :password, :password_confirmation, :remember_me) }
  end

  def pundit_user
    current_participant
  end

  def current_user
    current_participant
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

  def not_authorized
    flash[:error] = "You are not authorised for this action"
    redirect_to root_path
  end
end
