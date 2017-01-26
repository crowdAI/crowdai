class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  skip_filter :authenticate_participant!
  before_filter :auth_by_api_key
  respond_to :json


  def auth_by_api_key
    authenticate_or_request_with_http_token do |token, options|
      organizer = Organizer.where(api_key: token).first
      (token == ENV['CROWDAI_API_KEY'] || organizer.present?)
    end
  end
end
