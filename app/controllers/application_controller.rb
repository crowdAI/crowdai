# frozen_string_literal: true
class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception, prepend: true
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized_or_login
  after_action :participant_activity
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_paper_trail_whodunnit

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    payload[:user_id] = current_user.id if current_user
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :remember_me)
    end
  end

  def pundit_user
    current_participant
  end

  def current_user
    current_participant #|| NullParticipant.new
  end

  private
  def after_sign_in_path_for(resource)
    session["participant_return_to"] || root_path
  end

  def participant_activity
    current_participant.try :touch
  end

  def not_authorized_or_login
    if current_participant
      not_authorized
    else
      request_login
    end
  end

  def request_login
    flash[:info] = 'Please log into crowdAI to perform this action.'
    redirect_to new_participant_session_path
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
