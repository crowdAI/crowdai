class Api::OauthCredentialsController < ApplicationController
  before_action :doorkeeper_authorize!
  before_action -> { doorkeeper_authorize! :public }, only: :show
  before_action -> { doorkeeper_authorize! :write }, only: :update

  respond_to :json

  def show
    render json: current_resource_owner.as_json
  end

  def update
  end

  private
  def current_resource_owner
    if doorkeeper_token
      Participant.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
  end
end
