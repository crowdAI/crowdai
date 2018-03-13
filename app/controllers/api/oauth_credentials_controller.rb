class Api::OauthCredentialsController < ApplicationController
  before_action :doorkeeper_authorize!
  respond_to :json

  def me
    render json: { participant: current_resource_owner }, status: :ok
  end

  private
  def current_resource_owner
    Participant.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
