class Api::V1::BaseController < ApplicationController
  #protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  skip_filter :authenticate_participant!
  respond_to :json
end
