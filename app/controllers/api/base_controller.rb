class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  respond_to :json

  def auth_by_admin_api_key
    authenticate_or_request_with_http_token do |token, options|
      (token == ENV['CROWDAI_API_KEY'])
    end
  end

  def auth_by_api_key
    authenticate_or_request_with_http_token do |token, options|
      organizer = Organizer.where(api_key: token).first
      (token == ENV['CROWDAI_API_KEY'] || organizer.present?)
    end
  end

  def auth_by_api_key_and_client_id
    authenticate_or_request_with_http_token do |token, options|
      (token == ENV['CROWDAI_API_KEY'] || validate_client_name_and_api_key(request.params['challenge_client_name'],token) )
    end
  end

  def validate_client_name_and_api_key(challenge_client_name,api_key)
    challenge = Challenge.where(challenge_client_name: challenge_client_name).first
    organizer = Organizer.where(api_key: api_key).first
    challenge.present? && organizer.present? && challenge.organizer_id == organizer.id
  end

end
