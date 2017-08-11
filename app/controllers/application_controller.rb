# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  protect_from_forgery with: :exception
  after_action :participant_activity
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :remember_me)
    end
  end

  def pundit_user
    current_participant
  end

  def current_user
    current_participant || NullParticipant.new
  end

  private

  def participant_activity
    current_participant.try :touch
  end

  def not_authorized
    flash[:error] = 'You are not authorised to access this page.'
    redirect_to root_path
  end

  def terminate_challenge
    TerminateChallenges.new.call
  end

  def search_params
    params[:q]
  end

  def clear_search_index
    if params[:search_cancel]
      params.delete(:search_cancel)
      search_params&.each do |key, _param|
        search_params[key] = nil
      end
    end
  end

end
