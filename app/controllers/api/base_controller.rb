class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  before_action :auth_by_api_key
  respond_to :json


  def auth_by_api_key
    authenticate_or_request_with_http_token do |token, options|
      challenge = Challenge.where(api_key: token).first
      status = (token == ENV['CROWDAI_API_KEY'] || challenge.present?)
      Rails.logger.info "Key starting with: #{token[0..3]} received, status: #{status}"
      return status
    end
  end
end
