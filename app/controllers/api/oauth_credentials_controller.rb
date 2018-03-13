class Api::OauthCredentialsController < ApplicationController
  before_action :doorkeeper_authorize!
  respond_to :json

  def me
    render json: current_resource_owner
  end

  private
  def current_resource_owner
    if doorkeeper_token
      Participant.find(doorkeeper_token.resource_owner_id)
    end
  end
end
