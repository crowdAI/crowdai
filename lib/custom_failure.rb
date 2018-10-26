class CustomFailure < Devise::FailureApp
  include ActionView::Helpers::UrlHelper

  def redirect_url
    if params[:participant].present?
      participant = Participant.find_by(
        email: params[:participant][:email])
      if participant.present? && participant.confirmed_at.blank?
        flash[:alert] = "Your account has not yet been confirmed. Please check your email and confirm your account or #{link_to 'request a new confirmation link.', new_participant_confirmation_path}".html_safe
      end
    end
    new_participant_session_url(:subdomain => 'secure')
   end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end
