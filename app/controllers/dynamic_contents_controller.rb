class DynamicContentsController < ApplicationController
  before_action :authenticate_participant!
  before_action :set_challenge

  def show
  end

  def set_challenge
    @challenge = Challenge.friendly.find(params[:challenge_id])
  end

end
