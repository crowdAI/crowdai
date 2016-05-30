class Api::V1::BaseController < ApplicationController
  #protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  skip_filter :authenticate_participant!
  #before_filter :auth_by_api_key
  respond_to :json


  def auth_by_api_key
    api_key = '***REMOVED***'
    authorised = false
    authenticate_or_request_with_http_token do |token, options|
      logger.debug token
      logger.debug api_key
      if token != api_key
        render status: :unauthorized
      end
    end
  end
end
